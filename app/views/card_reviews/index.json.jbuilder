json.array!(@card_reviews) do |card_review|
  json.extract! card_review, :id, :user_id, :card_id, :type, :rating, :interval, :ease, :time
  json.url card_review_url(card_review, format: :json)
end
