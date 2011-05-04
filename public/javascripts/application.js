$(function(){
  $('a.upvote').live('click', function(){
    parent = $(this).parents('p');
    id = $('input.idea', parent).val();
    url = ($('input.page', parent).val() == 'index') ? '/' : '/ideas/'+id;

    $.post('/ideas/' + id + '/upvote', {id:id}, function(){
      parent.load(url + ' p#votes_'+ id +' span');
    });
  });
  
  $('a.downvote').live('click', function(){
    parent = $(this).parents('p');
    id = $('input.idea', parent).val();
    url = ($('input.page', parent).val() == 'index') ? '/' : '/ideas/'+id;

    $.post('/ideas/' + id + '/downvote', {id:id}, function(){
			parent.load(url + ' p#votes_'+ id +' span');
    });
  });
});
