class PropertiesController < ApplicationController
  # before_action :set_property, only: %i[ show edit update destroy ]

  # GET /properties or /properties.json
  def index
    @properties = Property.all
  end

  # GET /properties/1 or /properties/1.json
  def show
    @station = @property.station
  end

  # GET /properties/new
  def new
    @property = Property.new
    @property.stations.build
  end

  # GET /properties/1/edit
  def edit
    @station = @property.station
  end

  # POST /properties or /properties.json
  def create
    @property = Property.new(property_params)
      if @property.save
        redirect_to properties_path, notice:"物件を登録しました"
      else
        render :new
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: "Property was successfully updated." }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: "Property was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:name, :rent, :address, :age, :note, station_attributes: [:route_name, :station_name, :minutes_on_foot])
    end
end
