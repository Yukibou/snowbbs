class AvalancheInfomationsController < ApplicationController
  before_action :set_avalanche_infomation, only: [:show]
  before_action :authorize_avalanche_infomation, only: [:index]
  after_action :verify_authorized

  def index
    @avalanche_infomations = policy_scope(AvalancheInfomation).sort_order
  end

  def show
  end

  private
  def set_avalanche_infomation
    @avalanche_infomation = AvalancheInfomation.find(params[:id])
    authorize @avalanche_infomation
  end

  def authorize_avalanche_infomation
    authorize policy_scope(AvalancheInfomation)
  end
end
