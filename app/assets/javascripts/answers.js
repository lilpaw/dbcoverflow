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
      console.log(response);

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
    });
  });
});