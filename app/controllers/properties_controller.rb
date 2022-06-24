class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]

  # GET /properties or /properties.json
  def index
    @properties = Property.all
  end

  # GET /properties/1 or /properties/1.json
  def show
    @stations = @property.stations
  end

  # GET /properties/new
  def new
    @property = Property.new
    2.times { @property.stations.build }
  end

  # GET /properties/1/edit
  def edit
    @stations = @property.stations.build
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
      if @property.update(property_params)
        redirect_to properties_path, notice: "Property was successfully updated." 
      else
        render :edit
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
      params.require(:property).permit(:name, :rent, :address, :age, :note, stations_attributes: [:route_name, :station_name, :minutes_on_foot])
    end
end
