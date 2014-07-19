class Card < ActiveRecord::Base
  belongs_to :facebook_friend
  belongs_to :user
  has_many :card_reviews

  def self.generate_cards_for(user)
    user.import_friends!

    facebook_friends = user.facebook_friends
    facebook_friends.each do |friend|
      card = user.cards.new(
        front: "Where does #{friend.name} work?",
        back: friend.work,
        due: Time.now,
        facebook_friend_id: friend.id
      )
      card.save!
    end
  end
end
