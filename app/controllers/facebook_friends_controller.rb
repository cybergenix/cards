class FacebookFriendsController < ApplicationController
  before_action :set_facebook_friend, only: [:show, :edit, :update, :destroy]

  def index
    @facebook_friends = current_user.facebook_friends.all
  end

  def show
  end

  def new
    @facebook_friend = current_user.facebook_friends.new
  end

  def edit
  end

  def create
    @facebook_friend = current_user.facebook_friends.new(facebook_friend_params)

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

  def destroy
    @facebook_friend.destroy
    respond_to do |format|
      format.html { redirect_to facebook_friends_url, notice: 'Facebook friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy_all
    current_user.facebook_friends.destroy_all
    respond_to do |format|
      format.html { redirect_to facebook_friends_url, notice: 'Facebook friends were successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    @importer = FacebookFriendImporter.new(current_user)
    @importer.import
    respond_to do |format|
      format.html { redirect_to facebook_friends_url, notice: 'Facebook friends were successfully created.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facebook_friend
      @facebook_friend = current_user.facebook_friends.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facebook_friend_params
      params.require(:facebook_friend).permit(:name, :photo, :work, :location, :birthday, :college, :significant_other, :user_id, :facebook_id)
    end
end
