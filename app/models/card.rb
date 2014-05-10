class Card < ActiveRecord::Base
  belongs_to :user
  has_many :card_reviews

  def self.generate_cards_for(user)
    facebook_friends = user.facebook_friends
    facebook_friends.each do |friend|
      card = user.cards.new(
        front: "Where does #{friend.name} work?",
        back: friend.work,
        due: Time.now
      )
      card.save!
    end
  end
end
