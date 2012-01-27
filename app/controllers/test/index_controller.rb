class Test::IndexController < ApplicationController
  def index
    #@question = Question.find(params[:q])
    @questions = Question.all

  end

end
