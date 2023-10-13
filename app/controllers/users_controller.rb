class UsersController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = User.where(tenant_id: params[:tenant_id])
  end

  def show
  end

  # GET /tenants/new
  def new
    @user = User.new
  end

  # GET /tenants/1/edit
  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end  
end
