class ObservationsController < ApplicationController
  before_action :set_observation, only: [:show]
  before_action :authorize_observation, only: [:index]
  after_action :verify_authorized

  def index
    @search = Observation.ransack(params[:q])
    @observations = @search.result.page(params[:page])
    @observations = policy_scope(@observations).list_order
  end

  def show
  end

  private
  def set_observation
    @observation = Observation.find(params[:id])
    authorize @observation
  end

  def authorize_observation
    authorize policy_scope(Observation)
  end
end
