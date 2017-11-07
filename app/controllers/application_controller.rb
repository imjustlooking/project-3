class ApplicationController < ActionController::Base
<<<<<<< HEAD
  # before_action :authenticate_user!
=======

>>>>>>> 602c22698fd4b254cd925a999ef61605d4f896d6
  protect_from_forgery with: :exception

before_action :configure_permitted_parameters, if: :devise_controller?

protected

 def configure_permitted_parameters
 devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :phoneNumber])
 end


end
