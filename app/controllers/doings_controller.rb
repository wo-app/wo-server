class DoingsController < ApplicationController
  before_action :set_organization

  def index
    @doings = @organization.doings.recent

    render json: @doings
  end

  def create
    @doing = Doing.new(doing_params)
    @doing.user = @organization.users.find_or_create_by(user_params)

    if @doing.save
      render json: @doing, status: :created
    else
      render json: @doing.errors, status: :unprocessable_entity
    end
  end

  private

  def set_doing
    @doing = Doing.find(params[:id])
  end

  def set_organization
    @organization = Organization.find_by(organization_params)
  end

  def doing_params
    params.require(:doing).permit(:repo, :branch)
  end

  def user_params
    params.require(:user).permit(:name)
  end

  def organization_params
    params.require(:organization).permit(:token)
  end
end
