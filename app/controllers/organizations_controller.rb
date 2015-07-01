class OrganizationsController < ApplicationController
  def create
    @organization = Organization.new

    if @organization.save
      render json: @organization, status: :created
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

  private

  def set_organization
    @organization = Organization.find(params[:id])
  end
end
