module Api
  class FeedbacksController < ApplicationController
    def create
      Feedback.create!(params.require(:feedback).permit(:username, :comments))
      redirect_to :new_feedback
    end
  end
end
