class NeighborhoodsController < ApplicationController
  before_action :set_neighborhood, only: %i[ show update destroy ]

  # GET /neighborhoods
  def index
  
    permit_neighborhoods = Permit.all.collect { |p| p["neighborhood"] }.uniq.drop(1)
    #binding.pry
   
    sorted_neighborhoods =  permit_neighborhoods.sort_by {|n| n[0]}
    render json: sorted_neighborhoods
  end

  # GET /neighborhoods/1
  def show
    render json: @neighborhood
  end

  # POST /neighborhoods
  def create
    @neighborhood = Neighborhood.new(neighborhood_params)

    if @neighborhood.save
      render json: @neighborhood, status: :created, location: @neighborhood
    else
      render json: @neighborhood.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /neighborhoods/1
  def update
    if @neighborhood.update(neighborhood_params)
      render json: @neighborhood
    else
      render json: @neighborhood.errors, status: :unprocessable_entity
    end
  end

  # DELETE /neighborhoods/1
  def destroy
    @neighborhood.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_neighborhood
      @neighborhood = Neighborhood.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def neighborhood_params
      params.fetch(:neighborhood, {})
    end
end
