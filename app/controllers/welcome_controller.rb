class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      @cards = current_user.card_backlog
    else
      render layout: 'home'
    end
  end
end
