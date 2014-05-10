json.array!(@cards) do |card|
  json.extract! card, :id, :note_id, :card_type_id, :front, :back, :due, :position, :facebook_friend_id, :user_id, :average_review_time, :reviews_count, :lapses_count
  json.url card_url(card, format: :json)
end
