import { observable, action } from 'mobx';
import PostFeedbackService from
  '../services/PostFeedbackService';


class FeedbackStore {
  @observable userName = 'enter username';
  @observable comments = 'comments';

  @action
  setUserName = (val) => {
    this.userName = val;
  };

  @action
  setComments = (val) => {
    this.comments = val;
  };

  onSubmit = () => {
    PostFeedbackService.postNewFeedback({ feedback:
          { username: this.userName, comments: this.comments }
    });
  }
}

export default FeedbackStore;
