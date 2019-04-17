require 'test_helper'

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  def test_create
    post api_feedbacks_path,
         params: { feedback: { username: 'Taylor', comments: 'Taylor\'s comments' } }
    assert_redirected_to new_feedback_path

    created_feedback = Feedback.last
    assert_equal 'Taylor', created_feedback.username
    assert_equal 'Taylor\'s comments', created_feedback.comments
  end
end
