class CardReviewsController < ApplicationController
  before_action :set_card, only: [:new, :see_back, :set_interval]
  before_action :set_card_review, only: [:show, :edit, :update, :destroy, :see_back, :set_interval]

  # GET /card_reviews
  # GET /card_reviews.json
  def index
    @card_reviews = CardReview.all
  end

  # GET /card_reviews/1
  # GET /card_reviews/1.json
  def show
  end

  # GET /card_reviews/new
  def new
    @card_review = @card.card_reviews.create
  end

  # GET /card_reviews/1/edit
  def edit
  end

  # PATCH/PUT /card_reviews/1
  # PATCH/PUT /card_reviews/1.json
  def update
    respond_to do |format|
      if @card_review.update(card_review_params)
        format.html { redirect_to @card_review, notice: 'Card review was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_review }
      else
        format.html { render :edit }
        format.json { render json: @card_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_reviews/1
  # DELETE /card_reviews/1.json
  def destroy
    @card_review.destroy
    respond_to do |format|
      format.html { redirect_to card_reviews_url, notice: 'Card review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def see_back
  end

  def set_interval
    @card.due += case params[:commit]
      when '10m' then 10.minutes
      when '1d' then 1.day
      when '7d' then 7.days
    end
    @card.save!
    redirect_to new_card_card_review_path(current_user.next_card)
  end

  private

    def set_card
      @card = Card.find(params[:card_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_card_review
      @card_review = CardReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_review_params
      params.require(:card_review).permit(:user_id, :card_id, :type, :rating, :interval, :ease, :time)
    end
end
