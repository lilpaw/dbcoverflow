class AnswersController < ApplicationController

  def create
    @question = Question.where(id: params[:id]).first
    if Answer.create(question_id: params[:id],
      title: params[:answer][:title],
      content: params[:answer][:content])

      redirect_to question_path(@question)
    else
      status 401
      redirect_to question_path(@question)
    end
  end

  def upvote
    @question = Question.find(params[:id])
    @answer = Answer.where(id: params[:answer_id]).first
    @answer.votecount += 1
    @answer.save
    redirect_to question_path(@question.id)
  end

  def downvote
    @question = Question.find(params[:id])
    @answer = Answer.where(id: params[:answer_id]).first
    @answer.votecount -= 1
    @answer.save
    redirect_to question_path(@question.id)
  end
end
