class SessionsController < ApplicationController
   skip_before_filter :verify_authenticity_token
  
  def new
    response.headers['WWW-Authenticate'] = Rack::OpenID.build_header(
        :identifier => "https://www.google.com/accounts/o8/id",
        :required => ["http://axschema.org/contact/email",
                      "http://axschema.org/namePerson/first",
                      "http://axschema.org/namePerson/last"],
        :return_to => sessions_url,
        :method => 'POST')
    head 401
  end
  
  def create
    if openid = request.env[Rack::OpenID::RESPONSE]
      case openid.status
      when :success
        ax = OpenID::AX::FetchResponse.from_success_response(openid)
        user = User.where(:identifier_url => openid.display_identifier).first
        user ||= User.create(:identifier_url => openid.display_identifier,
                              :email => ax.get_single('http://axschema.org/contact/email'),
                              :name => ax.get_single('http://axschema.org/namePerson/first') + " " + ax.get_single('http://axschema.org/namePerson/last'),
                              :role => "student",
                              :favorites => Array.new)
        session[:user_id] = user.id
        if user.name.blank?
          redirect_to(user_additional_info_path(user))
        else
          redirect_to(session[:redirect_to] || root_path)
        end
      when :failure
        render :action => 'problem'
      end
    else
      redirect_to new_session_path
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
    

  end
end