class FacebookFriendImporter

  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def import
    create_friends(facebook_friend_pages)
  end

  private

  def graph
    @graph ||= Koala::Facebook::API.new(user.facebook_access_token)
  end

  def facebook_friend_pages
    graph.get_connections("me", "friends", fields: "name,work,picture.height(320).width(320)")
  end

  def create_friends(facebook_friend_pages)
    while facebook_friend_pages.present?
      facebook_friend_pages.each do |facebook_friend|
        create_friend_from_facebook(facebook_friend)
      end
      facebook_friend_pages = facebook_friend_pages.next_page
    end
  end

  def create_friend_from_facebook(facebook_friend)
    user.facebook_friends.find_or_create_by(facebook_id: facebook_friend["id"]) do |friend|
      friend.name =  facebook_friend["name"]
      friend.work = facebook_friend["work"]
      friend.photo = facebook_friend["picture"]["data"]["url"]
    end
  end

end
