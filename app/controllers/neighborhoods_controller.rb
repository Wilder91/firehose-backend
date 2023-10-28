class NeighborhoodsController < ApplicationController
  before_action :set_neighborhood, only: %i[ show update destroy ]

  # GET /neighborhoods
  def index
    neighborhoods = Neighborhood.all.drop(1).sort_by {|n| n['name']}.uniq {|n| n['name']}
    @neighborhoods = neighborhoods.reject {|n| n['population'] === '0'}

    render json: @neighborhoods
    
  end

  # GET /neighborhoods/1

  def names 
    permit_neighborhoods = Permit.all.collect { |p| p["neighborhood"] }.uniq.drop(1)
    #binding.pry
   
    sorted_neighborhoods =  permit_neighborhoods.sort_by {|n| n[0]}
    render json: sorted_neighborhoods
  end
  def show
    render json: @neighborhood
  end

  # POST /neighborhoods
  def create
   #binding.pry
   
   
    params['neighborhoods'].each do |p|
      #binding.pry
     
      @neighborhood = Neighborhood.new
      @neighborhood.name = p['properties']['Name']
      @neighborhood.population = p['properties']['Population']
      @neighborhood.white = p['properties']['White']
      @neighborhood.black_AfAm = p['properties']['Blk_AfAm']
      @neighborhood.amInd_AkNa = p['properties']['AmInd_AkNa']
      @neighborhood.asian = p['properties']['Asian']
      @neighborhood.natHaw_Pac = p['properties']['NatHaw_Pac']
      @neighborhood.other_Race = p['properties']['Other_Race']
      @neighborhood.twoOrMore = p['properties']['TwoOrMore']
      @neighborhood.isp_Lat = p['properties']['Hisp_Lat']
      @neighborhood.housing = p['properties']['Housing']
      @neighborhood.occupied = p['properties']['Occupied']
      @neighborhood.unoccupied = p['properties']['Vacant']
      
      @neighborhood.save
    end
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
