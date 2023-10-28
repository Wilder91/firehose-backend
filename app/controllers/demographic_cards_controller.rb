class DemographicCardsController < ApplicationController
  before_action :set_demographic_card, only: %i[ show update destroy ]

  # GET /demographic_cards
  def index
    @demographic_cards = DemographicCard.all.uniq

    render json: @demographic_cards
  end

  # GET /demographic_cards/1
  def show
    render json: @demographic_card
  end

  # POST /demographic_cards
  def create
    binding.pry
    @demographic_card = DemographicCard.new(demographic_card_params)
    params['neighborhoods'].each do |p|
      @neighborhood = neighborhood.new
      @neighborhood.address = p['properties']['Name']
      @neighborhood.description = p['properties']['Population']
      @neighborhood.neighborhood = p['properties']['White']
      @neighborhood.issued_date = p['properties']['Black_AfAm']
      @neighborhood.case_number = p['properties']['AmInd_AkNa']
      @neighborhood.case_number = p['properties']['Asian']
      @neighborhood.case_number = p['properties']['NatHaw_Pac']
      @neighborhood.case_number = p['properties']['Other_Race']
      @neighborhood.case_number = p['properties']['TwoOrMore']
      @neighborhood.case_number = p['properties']['Hisp_Lat']
      @neighborhood.case_number = p['properties']['Housing']
      @neighborhood.case_number = p['properties']['Occupied']
      @neighborhood.case_number = p['properties']['Unoccupied']
      
      @neighborhood.save
    end
    if @demographic_card.save
      render json: @demographic_card, status: :created, location: @demographic_card
    else
      render json: @demographic_card.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /demographic_cards/1
  def update
    if @demographic_card.update(demographic_card_params)
      render json: @demographic_card
    else
      render json: @demographic_card.errors, status: :unprocessable_entity
    end
  end

  # DELETE /demographic_cards/1
  def destroy
    @demographic_card.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_demographic_card
      @demographic_card = DemographicCard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def demographic_card_params
      params.fetch(:demographic_card, {})
    end
end
