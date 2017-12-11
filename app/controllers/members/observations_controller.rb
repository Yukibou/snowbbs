class Members::ObservationsController < Members::ApplicationController
  before_action :set_observation, only: [:show, :edit, :update, :destroy]
  before_action :authorize_observation, only: [:index, :new, :create]
  after_action :verify_authorized

  def index
    # 検索オブジェクト
    @search = Observation.ransack(params[:q])
    # 検索結果
    @observations = @search.result
    @observations = policy_scope(@observations).order(observation_at: :desc)
  end

  def show
  end

  def new
    @observation = current_user.observations.new
    @observation.evaluations.build
    @observation.build_danger_rating
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
  def set_observation
    @observation = Observation.find(params[:id])
    authorize @observation
  end

  def authorize_observation
    authorize policy_scope(Observation)
  end

  def observation_params
    params.require(:observation).permit(
        :observation_at,
        :area_id,
        :avalanche_infomation_id,
        :mountain,
        :location,
        :co_worker,
        :elevation_low,
        :elevation_high,
        :temperature_low,
        :temperature_low_hrs,
        :temperature_low_elevation,
        :temperature_high,
        :temperature_high_hrs,
        :temperature_high_elevation,
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
        :spin_nos,
        :comments,
        :publish,
        :movie_url,
        {images: []},
        :general_comments,
        evaluations_attributes: Evaluation::REGISTRABLE_ATTRIBUTES,
        danger_rating_attributes: DangerRating::REGISTRABLE_ATTRIBUTES)
  end
end
