class Members::AreasController < Members::ApplicationController
  before_action :authenticate_user!
  before_action :set_area, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def index
    @areas = Area.all.order(:id)
    authorize Area
  end

  def show
  end

  def new
    @area = Area.new
    authorize Area
  end

  def edit
  end

  def create
    @area = Area.new(area_params)
    authorize @area

    respond_to do |format|
      if @area.save
        format.html {redirect_to @area, notice: 'Area was successfully created.'}
      else
        format.html {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @area.update(area_params)
        format.html {redirect_to @area, notice: 'Area was successfully updated.'}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @area.destroy
    respond_to do |format|
      format.html {redirect_to areas_url, notice: 'Area was successfully destroyed.'}
    end
  end

  private
  def set_area
    @area = Area.find(params[:id])
    authorize @area
  end

  def area_params
    params.require(:area).permit(:name, :public)
  end
end
