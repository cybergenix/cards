class CardReviewsController < ApplicationController
  before_action :set_card_review, only: [:show, :edit, :update, :destroy]

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
    @card_review = CardReview.new
  end

  # GET /card_reviews/1/edit
  def edit
  end

  # POST /card_reviews
  # POST /card_reviews.json
  def create
    @card_review = CardReview.new(card_review_params)

    respond_to do |format|
      if @card_review.save
        format.html { redirect_to @card_review, notice: 'Card review was successfully created.' }
        format.json { render :show, status: :created, location: @card_review }
      else
        format.html { render :new }
        format.json { render json: @card_review.errors, status: :unprocessable_entity }
      end
    end
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_review
      @card_review = CardReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_review_params
      params.require(:card_review).permit(:user_id, :card_id, :type, :rating, :interval, :ease, :time)
    end
end
