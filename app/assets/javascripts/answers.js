$(document).ready(function() {
  $('#new_answer').on('submit', function(event){
    event.preventDefault();


    var new_answer_request = $.ajax({
      url: $(this).attr('action'),
      type: 'POST',
      data: $('#new_answer').serialize(),
      datatype: 'JSON',
    });

    new_answer_request.done(function(response){

      var newAnswer = $('.answers:first').clone()
      newAnswer.appendTo('.answer-list')

      newAnswer.find('.ans-votecount')
        .text(response.votecount)
        .end()
        .find('.ans-title')
        .text(response.title)
        .end()
        .find('.ans-content')
        .text(response.content)
        .end()

        document.getElementById("new_answer").reset();
    })
  })

  $('.button_to').on('click', function(event){
    event.preventDefault();

    var closestVotecount = $(this).parent('.votebutton').siblings('.ans-votecount')
    var voteRequest = $.ajax({
      url: $(this).attr('action'),
      type: 'PUT',
    });

    voteRequest.done(function(response){
      closestVotecount.text(response.votecount);
    })
    voteRequest.fail(function(response){
      alert("ajax FAILURE");
    })
  })

});