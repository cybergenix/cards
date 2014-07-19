class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :cards
  has_many :facebook_friends

  def generate_cards
    Card.generate_cards_for(self)
  end

  def import_friends!
    friends = graph.get_connections("me", "friends", fields: "name,work,picture.height(320).width(320)")

    while friends.present?
      friends.each { |f| facebook_friends.create(name: f["name"], work: "WORK", photo: f["picture"]["data"]["url"]) }
      friends = friends.next_page
    end
  end

  def next_card
    card_backlog.first
  end

  def card_backlog
    cards.order('due ASC')
  end

  def graph
    @graph ||= Koala::Facebook::API.new(facebook_access_token)
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.facebook_access_token = auth.credentials.token
      # user.name = auth.info.name
      # user.image = auth.info.image
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end
end
