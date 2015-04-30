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
    });
  });
});