class ApplicationController < ActionController::Base
  set_current_tenant_through_filter
  before_action :your_method_that_finds_the_current_tenant
  impersonates :user
  include Pundit::Authorization

  protect_from_forgery with: :exception
  
  # Workaround for login.. it should be on DeviseContoller::Session maybe
  skip_before_action :verify_authenticity_token
  before_action :configure_permitted_parameters, if: :devise_controller?


  def your_method_that_finds_the_current_tenant
    return unless current_user.present?    
    set_current_tenant(current_user.tenant)
  end  

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :tenant_id])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
    end
end
