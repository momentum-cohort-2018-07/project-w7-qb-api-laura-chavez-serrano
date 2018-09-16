class ApplicationController < ActionController::Base
  #include ActionController::HttpAuthentication::Token::ControllerMethods
   include ActionController::HttpAuthentication::Basic::ControllerMethods
  helper_method :current_user
  #before_action :verify_authentication
  

  
  
  protected
   def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
   end

   def logged_in?
     !!current_user
   end
  #def verify_authentication
   #user = authenticate_with_http_token do |token, options|
    # User.find_by_api_token(token)
   #end
  #end

   #unless user
    # render json: { error: " FUERA! ACCESS DENIED" }, status: :unauthorized
   #else
    # @current_user = user
   #end
  

end

