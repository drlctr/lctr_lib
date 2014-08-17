class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if:  :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
  	redirect_to root_url, alert: exception.message
  end

  def current_user
   super || guest_user
  end

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up).push(:username, :email)
  end

  private

  def guest_user
   User.find(session[:guest_user_id].nil? ? session[:guest_user_id] = create_guest_user.id : session[:guest_user_id])
  end

  def create_guest_user
    u = User.create(username: "guest", 
      email: "guest_#{Time.now.to_i}#{rand(99)}@example.com")
    u.save(validate: false)
    u
  end
  
end
