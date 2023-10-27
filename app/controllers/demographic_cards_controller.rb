class DemographicCardsController < ApplicationController
  before_action :set_demographic_card, only: %i[ show update destroy ]

  # GET /demographic_cards
  def index
    @demographic_cards = DemographicCard.all

    render json: @demographic_cards
  end

  # GET /demographic_cards/1
  def show
    render json: @demographic_card
  end

  # POST /demographic_cards
  def create
    @demographic_card = DemographicCard.new(demographic_card_params)

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
