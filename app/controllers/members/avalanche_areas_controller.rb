class Members::AvalancheAreasController < Members::ApplicationController
  before_action :authenticate_user!
  before_action :set_avalanche_area, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def index
    @avalanche_areas = AvalancheArea.all
    authorize AvalancheArea
  end

  def show
  end

  def new
    @avalanche_area = AvalancheArea.new
    authorize AvalancheArea
  end

  def edit
  end

  def create
    @avalanche_area = AvalancheArea.new(avalanche_area_params)
    authorize @avalanche_area

    respond_to do |format|
      if @avalanche_area.save
        format.html {redirect_to [:members, @avalanche_area], notice: 'Avalanche area was successfully created.'}
      else
        format.html {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @avalanche_area.update(avalanche_area_params)
        format.html {redirect_to [:members, @avalanche_area], notice: 'Avalanche area was successfully updated.'}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @avalanche_area.destroy
    respond_to do |format|
      format.html {redirect_to members_avalanche_areas_url, notice: 'Avalanche area was successfully destroyed.'}
    end
  end

  private

  def set_avalanche_area
    @avalanche_area = AvalancheArea.find(params[:id])
    authorize @avalanche_area
  end

  def avalanche_area_params
    params.require(:avalanche_area).permit(:name)
  end
end
