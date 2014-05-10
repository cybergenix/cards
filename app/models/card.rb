class Card < ActiveRecord::Base
  belongs_to :user

  def self.generate_cards_for(user)
    facebook_friends = user.facebook_friends
    facebook_friends.each do |friend|
      card = user.cards.new(
        front: "Where does #{friend.name} work?",
        back: friend.work
      )
      card.save!
    end
  end
end
