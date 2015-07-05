class UsersController < ApplicationController
  before_action :set_organization

  def index
    @users = @organization.users

    render json: @users
  end

  def set_organization
    @organization = Organization.find_by(organization_params)
  end

  def organization_params
    params.require(:organization).permit(:token)
  end
end
