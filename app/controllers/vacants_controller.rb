class VacantsController < ApplicationController
    def neighborhood_breakdown
        #binding.pry
        @neighborhoods= Vacant.all.collect { |p| p["neighborhood"] }.uniq

        #binding.pry
        arr = []
        @neighborhoods.each do |n|
            binding.pry
            x = Vacant.all.collect {|v| v["neighborhood"].split === n.split}
            arr.push(x)
        end
        render json: @neighborhoods
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