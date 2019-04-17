import { post } from '../utils/helper';

class PostFeedbackService {
  static postNewFeedback(props) {
    post('http://localhost:3000/api/feedbacks', props);
  }
}

export default PostFeedbackService;
