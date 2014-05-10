$('#card-back').html('<%= @card.back %>');
$('#card-prompt').html("<%= j render 'card_reviews/intervals' %>");
