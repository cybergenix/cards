class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      @cards = current_user.card_backlog
    end
  end
end
