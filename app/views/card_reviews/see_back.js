$('#card-back').html('<%= image_tag @card.facebook_friend.photo %> <%= @card.back %>');
$('#card-prompt').html("<%= j render 'card_reviews/intervals' %>");
