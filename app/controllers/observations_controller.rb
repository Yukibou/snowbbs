class ObservationsController < ApplicationController
  before_action :set_observation, only: [:show, :edit, :update, :destroy]

  # GET /observations
  # GET /observations.json
  def index
    @observations = Observation.all
  end

  # GET /observations/1
  # GET /observations/1.json
  def show
  end

  # GET /observations/new
  def new
    @observation = current_user.observations.new
    @observation.evaluations.build
  end

  # GET /observations/1/edit
  def edit
  end

  # POST /observations
  # POST /observations.json
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

  # PATCH/PUT /observations/1
  # PATCH/PUT /observations/1.json
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

  # DELETE /observations/1
  # DELETE /observations/1.json
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
        evaluations_attributes: Observation::REGISTRABLE_ATTRIBUTES)
  end
end
