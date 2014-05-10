class FacebookFriendsController < ApplicationController
  before_action :set_facebook_friend, only: [:show, :edit, :update, :destroy]

  # GET /facebook_friends
  # GET /facebook_friends.json
  def index
    @facebook_friends = FacebookFriend.all
  end

  # GET /facebook_friends/1
  # GET /facebook_friends/1.json
  def show
  end

  # GET /facebook_friends/new
  def new
    @facebook_friend = FacebookFriend.new
  end

  # GET /facebook_friends/1/edit
  def edit
  end

  # POST /facebook_friends
  # POST /facebook_friends.json
  def create
    @facebook_friend = FacebookFriend.new(facebook_friend_params)

    respond_to do |format|
      if @facebook_friend.save
        format.html { redirect_to @facebook_friend, notice: 'Facebook friend was successfully created.' }
        format.json { render :show, status: :created, location: @facebook_friend }
      else
        format.html { render :new }
        format.json { render json: @facebook_friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facebook_friends/1
  # PATCH/PUT /facebook_friends/1.json
  def update
    respond_to do |format|
      if @facebook_friend.update(facebook_friend_params)
        format.html { redirect_to @facebook_friend, notice: 'Facebook friend was successfully updated.' }
        format.json { render :show, status: :ok, location: @facebook_friend }
      else
        format.html { render :edit }
        format.json { render json: @facebook_friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facebook_friends/1
  # DELETE /facebook_friends/1.json
  def destroy
    @facebook_friend.destroy
    respond_to do |format|
      format.html { redirect_to facebook_friends_url, notice: 'Facebook friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facebook_friend
      @facebook_friend = FacebookFriend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facebook_friend_params
      params.require(:facebook_friend).permit(:name, :photo, :work, :location, :birthday, :college, :significant_other, :user_id, :facebook_id)
    end
end
