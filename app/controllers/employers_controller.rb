require 'csv'

class EmployersController < ApplicationController
  before_action :set_employer, only: [:show, :edit, :update, :destroy, :favorite, :defavorite]
  before_action :grant_access, only: [:edit, :update, :destroy, :create, :import_form, :import_from_csv]
  before_action :logged_in, only: [:favorite]

  def landing
    redirect_to conferences_select_con_path if current_user
  end

  def about_us
  end

  def favorite
    current_user.add_favorite(@employer.id)
    if current_user.save!
      flash[:success] = "Added #{@employer.name} from favorites."
      redirect_to :back
    else
      flash[:error] = "Something went wrong!"
      redirect_to :back
    end
  end

  def defavorite
    current_user.remove_favorite(@employer.id)
    if current_user.save!
      flash[:success] = "Removed #{@employer.name} from favorites."
      redirect_to :back
    else
      flash[:error] = "Something went wrong!"
      redirect_to :back
    end
  end

  def maps
    if params[:conference]== "set" || params[:conference]=="SET"
      @img_src="assets/maps/set/set.jpg"#define a string that is the path to that source
    elsif params[:conference]== "fest" || params[:conference]=="FEST"
      @img_src="path/to/fest_fair_map.jpg"
    else
      @img_src="path/to/default_map.jpg"
    end
  end

  def map
  end

  def map_upload
    uploaded_io = params[:map]

    File.open(Rails.root.join('public', 'uploads', 'maps', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    current_con.update_attributes(map: uploaded_io.original_filename)

    flash[:notice] = "Map saved!"
    redirect_to :controller => "employers", :action => 'map'
  end

  # GET /employers
  # GET /employers.json
  def index
    #we check if there is a current_con picked otherwise, we send them to pick a conference page
    if current_con
      @employers = Employer.includes(:conference).by_conference(current_con.id).find(current_user.favorites.map(&:to_i)) if params[:favorites] && current_user
      @employers ||= Employer.includes(:conference).where("conference_id = ?", current_con.id).by_conference(current_con).all
    else
      redirect_to :controller => "conferences", :action => 'select_con'
    end
  end

  # GET /employers/1
  # GET /employers/1.json
  def show
  end

  # GET /employers/new
  def new
    @employer = Employer.new
  end

  # GET /employers/1/edit
  def edit
  end

  # POST /employers
  # POST /employers.json
  def create
    @employer = Employer.new(employer_params)

    respond_to do |format|
      if @employer.save
        format.html { redirect_to @employer, notice: 'Employer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @employer }
      else
        format.html { render action: 'new' }
        format.json { render json: @employer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employers/1
  # PATCH/PUT /employers/1.json
  def update
    uploaded_io = employer_params[:logo]

    File.open(Rails.root.join('public', 'uploads', 'company_logos', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end unless employer_params[:logo].blank?

    respond_to do |format|
      if @employer.update(employer_params)
        format.html { redirect_to @employer, notice: 'Employer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @employer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employers/1
  # DELETE /employers/1.json
  def destroy
    User.where("'#{@employer.id}' = ANY (favorites)").each do |u|
      u.remove_favorite(@employer.id)
      u.save
    end


    @employer.destroy
    respond_to do |format|
      format.html { redirect_to employers_url }
      format.json { head :no_content }
    end
  end

  def import_form
    @conferences = Conference.all
  end

  def import_from_csv
    uploaded_io = params[:employers_csv]
    conference_id = params[:conference_id]

    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    CSV.foreach(Rails.root.join('public', 'uploads', uploaded_io.original_filename), :headers => true) do |row|
      unless row[1].nil? || row[1].empty?

        positions = Array.new
        positions << "Full Time"                 unless row[3].nil?  || row[3].empty?
        positions << "Part Time"                 unless row[4].nil?  || row[4].empty?
        positions << "Internship"                unless row[5].nil?  || row[5].empty?
        positions << "Co-Op"                     unless row[6].nil?  || row[6].empty?
        positions << "In SC"                     unless row[7].nil?  || row[7].empty?
        positions << "In Southeast"              unless row[8].nil?  || row[8].empty?
        positions << "Nationwide Positions"      unless row[9].nil?  || row[9].empty?
        positions << "Day After Fair Interviews" unless row[10].nil? || row[10].empty?

        Employer.create!({
          table_s: row[0],
          name: row[1],
          majors: row[2],
          description: row[11] || "",
          website: row[12] || "",
          location: row[13] || "",
          tips: row[14] || "",
          email: row[15] || "",
          conference_id: conference_id,
          positions: positions.join(',')
        })
      end
    end

    params[:employers_csv] = uploaded_io.original_filename
    flash[:sucess] = "The employers document, #{params[:employers_csv]} has been uploaded!"



    # if saved
    #   flash[:sucess] = "The employers document, #{params[:employers_csv]} has been uploaded!"
    # else
    #   flash[:error] = "There was a problem uploading your document."
    # end

    redirect_to employers_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employer
      @employer = Employer.includes(:conference).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employer_params
      params.require(:employer).permit(:name, :website, :description, :logo, :majors, :email, :positions, :tips, :created_at, :updated_at, :last_edit, :table_id, :conference_id, :location) if params[:employer]
    end
end
