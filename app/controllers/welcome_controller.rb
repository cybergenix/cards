class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      @cards = current_user.cards
    end
  end
end
