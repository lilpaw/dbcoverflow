$(document).ready(function() {

  $('.new-question-form').on('submit', function(event){
    event.preventDefault();

    var new_question_request = $.ajax({
      url: '/questions',
      type: 'POST',
      data: $('#new_question').serialize(),
      datatype: 'JSON',
    });

    new_question_request.done(function(response){
      console.log(response);

      var newQuestion = $('ul li:first').clone()
      newQuestion.appendTo('ul')

      newQuestion.find('.votecount')
        .text(response.votecount)
        .end()
        .find('.ques-title')
        .text(response.title)
        .end()
        .find('.ques-content')
        .text(response.content)
        .end()

        document.getElementById("new_question").reset();
    });
  });

  $('.question-detail').on('click','#ques-votebutton', function(event){
    event.preventDefault();
    debugger
    var voteRequest = $.ajax({
      url: $(this).attr('action'),
      type: 'PUT',
    });

    voteRequest.done(function(response){
      debugger
      $('.ques-votecount').text(response.votecount);
    })
    voteRequest.fail(function(response){
      alert("ajax FAILURE");
    })
  })

});