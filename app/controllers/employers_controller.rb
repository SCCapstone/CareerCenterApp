class EmployersController < ApplicationController
  before_action :set_employer, only: [:show, :edit, :update, :destroy, :favorite, :defavorite]
  before_action :grant_access, only: [:edit, :update, :destroy, :create]
  before_action :logged_in, only: [:favorite]

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

  # GET /employers
  # GET /employers.json
  def index
    @employers = Employer.includes(:conference).find(current_user.favorites.map(&:to_i)) if params[:favorites] && current_user 
    @employers ||= Employer.includes(:conference).all
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
    @employer.destroy
    respond_to do |format|
      format.html { redirect_to employers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employer
      @employer = Employer.includes(:conference).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employer_params
      params.require(:employer).permit(:name, :website, :description, :majors, :email, :positions, :tips, :created_at, :updated_at, :last_edit, :table_id, :conference_id)
    end
end
