$(function(){
  $('a.upvote').live('click', function(){
    parent = $(this).parents('p');
    id = $('input.idea', parent).val();
    url = (parent.hasClass('index')) ? '/' : '/ideas/'+id;

    $.post('/ideas/' + id + '/upvote', {id:id}, function(){
      parent.load(url + ' p#votes_'+ id +' span');
    });
  });
  
  $('a.downvote').live('click', function(){
    parent = $(this).parents('p');
    id = $('input.idea', parent).val();
    url = (parent.hasClass('index')) ? '/' : '/ideas/'+id;

    $.post('/ideas/' + id + '/downvote', {id:id}, function(){
			parent.load(url + ' p#votes_'+ id +' span');
    });
  });
  
  $('#flash_notice').fadeIn().delay(3500).fadeOut();
   
	$(".total_votes").textfill({maxFontSize: 60});
	
});

