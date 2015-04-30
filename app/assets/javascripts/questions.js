// $(document).ready(function() {

//   $('.new-question-form').on('submit', function(event){
//     event.preventDefault();

//     var new_question_request = $.ajax({
//       url: '/questions',
//       type: 'POST',
//       data: $('.new-question-form').serialized,
//       datatype: 'JSON',
//     });

//     new_question_request.done(function(response){
//       console.log(response);
//       $('.question-list questions:first').clone()
//       .appendTo('.question-list')
//       .find('.votecount')
//         .text(response.votecount)
//       .end()
//       .find('.answerscount')
//         .text(response.answers.count)
//       .end()
//       .find('.ques-title')
//         .text(response.title)
//       .end()
//       .find('.ques-content')
//         .text(response.content)
//       .end();
    });
  });
});