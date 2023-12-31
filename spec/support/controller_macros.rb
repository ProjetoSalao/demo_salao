# module ControllerHelpers
#   def login_with(user = double('user'), scope = :user)
#     current_user = "current_#{scope}".to_sym
#     if user.nil?
#       allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => scope})
#       allow(controller).to receive(current_user).and_return(nil)
#     else
#       allow(request.env['warden']).to receive(:authenticate!).and_return(user)
#       allow(controller).to receive(current_user).and_return(user)
#     end
#   end
# end


module ControllerMacros
  def login_user
    # Before each test, create and login the user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in FactoryBot.create(:user)
    end
  end
end