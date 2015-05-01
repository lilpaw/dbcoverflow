class AnswersController < ApplicationController

  # def create
  #   @question = Question.where(id: params[:question_id]).first
  #   if Answer.create(question_id: params[:question_id],
  #     title: params[:answer][:title],
  #     content: params[:answer][:content])

  #     redirect_to question_path(@question)
  #   else
  #     status 401
  #     redirect_to question_path(@question)
  #   end
  # end

  def create
    @question = Question.where(id: params[:question_id]).first
    @answer = Answer.new(
       question_id: params[:question_id],
       title: params[:answer][:title],
       content: params[:answer][:content])

      if @answer.save
        respond_to do |format|
          format.json { render json: @answer.to_json }
          format.html{ redirect_to question_path(@question)}
        end
      else
        status 406
        render :show
      end
  end

  def upvote
    @question = Question.find(params[:question_id])
    @answer = Answer.where(id: params[:id]).first
    @answer.votecount += 1
    @answer.save
    redirect_to question_path(@question.id)
  end

  def downvote
    @question = Question.find(params[:question_id])
    @answer = Answer.where(id: params[:id]).first
    @answer.votecount -= 1
    @answer.save
    redirect_to question_path(@question.id)
  end
end
