require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  before :each do
    get :index
  end

  it "displays all questions" do
    # expect(assigns(:questions)).to eq(Question.all)
    response.should contain()
  end

end
