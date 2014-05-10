json.array!(@facebook_friends) do |facebook_friend|
  json.extract! facebook_friend, :id, :name, :photo, :work, :location, :birthday, :college, :significant_other, :user_id, :facebook_id
  json.url facebook_friend_url(facebook_friend, format: :json)
end
