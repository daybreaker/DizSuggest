$(function(){
  $('a.upvote').live('click', function(){
    parent = $(this).parents('p');
    id = parent.attr('id').split('_');
    $.post('ideas/' + id[1] + '/upvote', {id:id}, function(){
      parent.load('/ p#votes_'+id[1]+' span');
    });
  });
  
  $('a.downvote').live('click', function(){
    parent = $(this).parents('p');
    id = parent.attr('id').split('_');
    $.post('ideas/' + id[1] + '/downvote', {id:id}, function(){
			parent.load('/ p#votes_'+id[1]+' span');
    });
  });
});
