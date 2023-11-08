class SituationsController < ApplicationController
  before_action :set_situation, only: %i[ show edit update destroy bid]

  # GET /situations or /situations.json
  def index
    @situations = Situation.all
  end

  # GET /situations/1 or /situations/1.json
  def show
    @hand = @situation.hand
    @cards = @situation.hand.cards.order(:suit_id, :value_id)
  end

  # GET /situations/new
  def new
    @situation = Situation.new
    @hands = Hand.all
  end

  # GET /situations/1/edit
  def edit
    bti = BidType.where(name: 'Slut').first.id
    @slut = Bid.where(bid_type_id: bti).first
    unless @situation.bids.include? @slut
      if @situation.bids.any?
        tid = @situation.bids.last.bid_type_id + 1
        nmb = @situation.bids.last.number
        suit = @situation.bids.last.suit_id
      else
        tid = 1
        nmb = 1
        suit = 0
        logger.info "tid #{tid} nmb #{nmb} suit #{suit}"
      end
      @bids = Bid.where(bid_type_id: tid).where("(number = ? and suit_id > ?) or number > ?", nmb, suit, nmb).order(:number, :suit_id).to_a
      @bids << @slut
    end
  end

  # POST /situations or /situations.json
  def create
    @situation = Situation.new(situation_params)

    respond_to do |format|
      if @situation.save
        format.html { redirect_to edit_situation_url(@situation), notice: "Situation was successfully created." }
        format.json { render :show, status: :created, location: @situation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @situation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /situations/1 or /situations/1.json
  def update
    if situation_params[:bid_id]
      @situation.bids << Bid.find(situation_params[:bid_id])
    end
    
    respond_to do |format|
      if @situation.update(situation_params.except(:bid_id))
        format.html { redirect_to edit_situation_url(@situation), notice: "Situation was successfully updated." }
        format.json { render :show, status: :ok, location: @situation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @situation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /situations/1 or /situations/1.json
  def destroy
    @situation.destroy

    respond_to do |format|
      format.html { redirect_to situations_url, notice: "Situation was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  def hand
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_situation
      @situation = Situation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def situation_params
      # params.fetch(:situation, {})
      # .require(:situation)
      params.require(:situation).permit(:id, :intro, :summary, :hand_id, :bid_id)
    end
end
