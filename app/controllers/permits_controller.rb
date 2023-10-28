

class PermitsController < ApplicationController


  # GET /permits
  def index
    @permits = Permit.all.uniq
    #binding.pry
    render json: @permits.uniq()
  end

  def show
    

  end

  # GET /permits/1
  def neighborhoodpermits
   
    @permits = Permit.all
    @neighborhoodpermits = @permits.collect { |p| p["neighborhood"] }.uniq
    render json: @neighborhoodpermits
  end
  # POST /permits
  def create
    #binding.pry
    
    params['permits'].each do |p|
          @permit = Permit.new
          @permit.address = p['properties']['Address']
          @permit.description = p['properties']['Description']
          @permit.neighborhood = p['properties']['Neighborhood']
          @permit.issued_date = p['properties']['IssuedDate']
          @permit.case_number = p['properties']['CaseNumber']
          @permit.save
    end
    
    if @permit.save
      render json: @permit, status: :created, location: @permit
    else
      render json: @permit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /permits/1
  def update
    if @permit.update(permit_params)
      render json: @permit
    else
      render json: @permit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /permits/1
  def destroy
    @permit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permit
      @permit = Permit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def permit_params
      params.fetch(:permit, {})
    end
end
