$(function(){
  $('a.upvote').live('click', function(){
    parent = $(this).parents('div.votes');
    id = $('input.idea', parent).val();
    url = (parent.hasClass('index')) ? '/' : '/ideas/'+id;

    $.post('/ideas/' + id + '/upvote', {id:id}, function(){
      parent.load(url + ' div#votes_'+ id, function(){
				$(".total_votes").textfill({maxFontSize: 60});
			});
    });
  });
  
  $('a.downvote').live('click', function(){
    parent = $(this).parents('div.votes');
    id = $('input.idea', parent).val();
    url = (parent.hasClass('index')) ? '/' : '/ideas/'+id;

    $.post('/ideas/' + id + '/downvote', {id:id}, function(){
			parent.load(url + ' div#votes_'+ id, function(){
				$(".total_votes").textfill({maxFontSize: 60});
			});
    });
  });
  
  $('#flash_notice').fadeIn().delay(3500).fadeOut();
   
	$(".total_votes").textfill({maxFontSize: 60});
	
	$(".reply").click(function(){
		reply = $(this);
		$.get(reply.attr('href'), function(data){
			reply.parent('div').append(data);
		});
		return false;
	});
	
});

