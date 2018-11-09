class Members::AvalancheInfomationsController < Members::ApplicationController
  before_action :set_avalanche_infomation, only: [:show, :edit, :update, :destroy]
  before_action :authorize_avalanche_infomation, only: [:index, :new, :create]
  after_action :verify_authorized

  def index
    @avalanche_infomations = policy_scope(AvalancheInfomation).sort_order
  end

  def show
  end

  def new
    @avalanche_infomation = current_user.avalanche_infomations.new
    @avalanche_problem = @avalanche_infomation.avalanche_problems.build
    @avalanche_problem.zone_details.build(zone: :alpine)
    @avalanche_problem.zone_details.build(zone: :treeline)
    @avalanche_problem.zone_details.build(zone: :below_treeline)
  end

  def edit
  end

  def create
    @avalanche_infomation = current_user.avalanche_infomations.new(avalanche_infomation_params)

    respond_to do |format|
      if @avalanche_infomation.save
        format.html {redirect_to [:members, @avalanche_infomation], notice: 'Avalanche infomation was successfully created.'}
      else
        format.html {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @avalanche_infomation.update(avalanche_infomation_params)
        format.html {redirect_to [:members, @avalanche_infomation], notice: 'Avalanche infomation was successfully updated.'}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @avalanche_infomation.destroy
    respond_to do |format|
      format.html {redirect_to members_avalanche_infomations_url, notice: 'Avalanche infomation was successfully destroyed.'}
      format.json {head :no_content}
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

  def avalanche_infomation_params
    params.require(:avalanche_infomation).permit(
        :announced_at,
        :area_id,
        :alpine_zone,
        :alpine_trend,
        :alpine_comments,
        :alpine_confidence,
        :treeline_zone,
        :treeline_trend,
        :treeline_comments,
        :treeline_confidence,
        :below_treeline_zone,
        :below_treeline_trend,
        :below_treeline_comments,
        :below_treeline_confidence,
        :avalanche,
        :snowpack,
        :weather,
        :travel_advisory,
        avalanche_problems_attributes: AvalancheProblem::REGISTRABLE_ATTRIBUTES
    )
  end
end
