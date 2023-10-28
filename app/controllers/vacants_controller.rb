class VacantsController < ApplicationController
    def neighborhood_breakdown
        #binding.pry
        @neighborhoods= Vacant.all.collect { |p| p["neighborhood"] }.uniq

        #binding.pry
        neighborhood_vacants = {} # Initialize an empty hash to store vacants by neighborhood

    @neighborhoods.each do |n|
        neighborhood_vacants[n] = Vacant.all.select { |v| v["neighborhood"].split == n.split }
    end
    #binding.pry
    neighborhood_stats = []

    neighborhood_vacants.each do |neighborhood, vacants|
        neighborhood_stats << { neighborhood: neighborhood.strip, vacant_count: vacants.size }
    end

    #binding.pry
        render json: neighborhood_stats.sort_by {|v| -v[:vacant_count]}
    end

    def index
        @vacants = Vacant.all



        
        render json: @vacants
    end

    def create 
        #binding.pry
        params['vacants']['features'].each  do |v|
            #binding.pry
            @vacant = Vacant.new
            @vacant.address = v['properties']['Address']
            @vacant.neighborhood = v['properties']['Neighborhood']
            @vacant.council_district = v['properties']['Council_District']
            @vacant.typology = v['properties']['HousingMarketTypology2017']
            @vacant.datenotice = v['properties']['DateNotice']
            @vacant.datecancel = v['properties']['DateCancel']
            @vacant.owner_abbr = v['properties']['OWNER_ABBR']
            @vacant.save
        end
    end


    
end