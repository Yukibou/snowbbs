class AvalancheInfomationsController < ApplicationController
  before_action :set_avalanche_infomation, only: [:show, :edit, :update, :destroy]

  def index
    @avalanche_infomations = AvalancheInfomation.all
  end

  def show
  end

  def new
    @avalanche_infomation = current_user.avalanche_infomations.new
  end

  def edit
  end

  def create
    @avalanche_infomation = current_user.avalanche_infomations.new(avalanche_infomation_params)

    respond_to do |format|
      if @avalanche_infomation.save
        format.html {redirect_to @avalanche_infomation, notice: 'Avalanche infomation was successfully created.'}
        format.json {render :show, status: :created, location: @avalanche_infomation}
      else
        format.html {render :new}
        format.json {render json: @avalanche_infomation.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @avalanche_infomation.update(avalanche_infomation_params)
        format.html {redirect_to @avalanche_infomation, notice: 'Avalanche infomation was successfully updated.'}
        format.json {render :show, status: :ok, location: @avalanche_infomation}
      else
        format.html {render :edit}
        format.json {render json: @avalanche_infomation.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @avalanche_infomation.destroy
    respond_to do |format|
      format.html {redirect_to avalanche_infomations_url, notice: 'Avalanche infomation was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  def set_avalanche_infomation
    @avalanche_infomation = AvalancheInfomation.find(params[:id])
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
        :travel_advisory
        )
  end
end
