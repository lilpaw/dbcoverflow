class QuestionsController < ApplicationController

  # get '/'
  def index
    @questions = Question.all
    @question = Question.new
    @api_client = GithubAdapter.new
    @response = @api_client.zen.parsed_response

    if @response
      @response
    else
      @response = "Music is the emotional life of most people."
    end



  end

  # get 'questions/:id'
  def show
    @question = Question.find(params[:id])
    # @answers = Answer.where(question_id: @question.id)
    @answer = Answer.new
  end

  # def create
  #   question = Question.new(question_params)
  #   if question.save
  #     redirect_to root_path
  #   else
  #     status 406
  #     render :index
  #   end
  # end

  def create
    @question = Question.new(question_params)

      if @question.save
      respond_to do |format|
        format.json { render json: @question.to_json }
        format.html{redirect_to root_path}
      end
      else
        status 406
        render :index
      end

  end


  def destroy
    @question = Question.find(params[:id])
    @question.destroy!
    redirect_to root_path
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to question_path(@question.id)
    else
      status 406
      render :edit
    end
  end

  def upvote
    @question = Question.find(params[:id])
    @question.votecount += 1
    @question.save
    redirect_to question_path(@question.id)
  end

  def downvote
    @question = Question.find(params[:id])
    @question.votecount -= 1
    @question.save
    redirect_to question_path(@question.id)
  end

  private
  def question_params
    params.require(:question).permit(:title, :content)
  end

end
