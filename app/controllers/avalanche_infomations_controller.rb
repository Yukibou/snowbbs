class AvalancheInfomationsController < ApplicationController
  before_action :set_avalanche_infomation, only: [:show]
  before_action :authorize_avalanche_infomation, only: [:index]
  before_action :set_area, only: [:latest_by_area]
  after_action :verify_authorized, except: [:latest_by_area]

  layout 'application_avalanche_info'

  def index
    @avalanche_infomations = policy_scope(AvalancheInfomation).sort_order
  end

  def show
  end

  def latest_by_area
    @avalanche_infomation = @area.avalanche_infomations.last
    if @avalanche_infomation.present?
      authorize @avalanche_infomation
    else
      render 'prepare_now'
    end
  end

  private
  def set_avalanche_infomation
    @avalanche_infomation = AvalancheInfomation.find(params[:id])
    authorize @avalanche_infomation
  end

  def authorize_avalanche_infomation
    authorize policy_scope(AvalancheInfomation)
  end

  def set_area
    @area = AvalancheArea.find params[:area_id]
  end
end
