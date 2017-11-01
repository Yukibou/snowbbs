class ObservationsController < ApplicationController
  before_action :set_observation, only: [:show, :edit, :update, :destroy]
  before_action :authorize_observation, only: [:index, :new, :create]
  after_action :verify_authorized

  def index
    @observations = Observation.all
  end

  def show
  end

  def new
    @observation = current_user.observations.new
    @observation.evaluations.build
  end

  def edit
  end

  def create
    @observation = current_user.observations.new(observation_params)

    respond_to do |format|
      if @observation.save
        format.html {redirect_to @observation, notice: 'Observation was successfully created.'}
        format.json {render :show, status: :created, location: @observation}
      else
        format.html {render :new}
        format.json {render json: @observation.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @observation.update(observation_params)
        format.html {redirect_to @observation, notice: 'Observation was successfully updated.'}
        format.json {render :show, status: :ok, location: @observation}
      else
        format.html {render :edit}
        format.json {render json: @observation.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @observation.destroy
    respond_to do |format|
      format.html {redirect_to observations_url, notice: 'Observation was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_observation
    @observation = Observation.find(params[:id])
    authorize @observation
  end

  def authorize_observation
    authorize Observation
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def observation_params
    params.require(:observation).permit(
        :observation_at,
        :area_id,
        :mountain,
        :location,
        :elevation_low,
        :elevation_low_comments,
        :elevation_high,
        :elevation_high_comments,
        :temperature,
        :sky,
        :sky_comments,
        :wind_speed,
        :wind_direction,
        :wind_comments,
        :precipitation_type,
        :precipitation_rate,
        :precipitation_comments,
        :avalanches,
        :avalanche_occurred,
        :snowpack,
        :spin_url,
        :comments,
        :publish,
        :movie_url,
        {images: []},
        evaluations_attributes: Observation::REGISTRABLE_ATTRIBUTES)
  end
end
