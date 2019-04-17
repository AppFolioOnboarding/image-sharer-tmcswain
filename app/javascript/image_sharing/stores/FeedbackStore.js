import { observable, action } from 'mobx';


class FeedbackStore {
  @observable userName = 'enter username';
  @observable comments = 'comments'

  @action
  setUserName = (val) => {
    this.userName = val;
  }

  @action
  setComments = (val) => {
    this.comments = val;
  }
}

export default FeedbackStore;
