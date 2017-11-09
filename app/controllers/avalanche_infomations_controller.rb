class AvalancheInfomationsController < ApplicationController
  before_action :set_avalanche_infomation, only: [:show, :edit, :update, :destroy]

  # GET /avalanche_infomations
  # GET /avalanche_infomations.json
  def index
    @avalanche_infomations = AvalancheInfomation.all
  end

  # GET /avalanche_infomations/1
  # GET /avalanche_infomations/1.json
  def show
  end

  # GET /avalanche_infomations/new
  def new
    @avalanche_infomation = AvalancheInfomation.new
  end

  # GET /avalanche_infomations/1/edit
  def edit
  end

  # POST /avalanche_infomations
  # POST /avalanche_infomations.json
  def create
    @avalanche_infomation = AvalancheInfomation.new(avalanche_infomation_params)

    respond_to do |format|
      if @avalanche_infomation.save
        format.html { redirect_to @avalanche_infomation, notice: 'Avalanche infomation was successfully created.' }
        format.json { render :show, status: :created, location: @avalanche_infomation }
      else
        format.html { render :new }
        format.json { render json: @avalanche_infomation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /avalanche_infomations/1
  # PATCH/PUT /avalanche_infomations/1.json
  def update
    respond_to do |format|
      if @avalanche_infomation.update(avalanche_infomation_params)
        format.html { redirect_to @avalanche_infomation, notice: 'Avalanche infomation was successfully updated.' }
        format.json { render :show, status: :ok, location: @avalanche_infomation }
      else
        format.html { render :edit }
        format.json { render json: @avalanche_infomation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avalanche_infomations/1
  # DELETE /avalanche_infomations/1.json
  def destroy
    @avalanche_infomation.destroy
    respond_to do |format|
      format.html { redirect_to avalanche_infomations_url, notice: 'Avalanche infomation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avalanche_infomation
      @avalanche_infomation = AvalancheInfomation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avalanche_infomation_params
      params.require(:avalanche_infomation).permit(:announced_at, :alpine_zone)
    end
end
