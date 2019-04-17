import { expect } from 'chai';
import { describe, it, beforeEach } from 'mocha';
import sinon from 'sinon';

import FeedbackStore from '../../stores/FeedbackStore';
import PostFeedbackService from '../../services/PostFeedbackService';

describe('FeedbackStore', () => {
  let store;
  beforeEach(() => {
    store = new FeedbackStore();
  });

  it('is initialized with default values', () => {
    expect(store.userName).to.equal('enter username');
    expect(store.comments).to.equal('comments');
  });

  it('sets userName', () => {
    store.setUserName('taylor');
    expect(store.userName).to.equal('taylor');
  });

  it('sets comments', () => {
    store.setComments('some comments');
    expect(store.comments).to.equal('some comments');
  });

  it('submits Feedback to the database', () => {
    store.setUserName('taylor');
    store.setComments('some comments');

    const stub = sinon.stub(PostFeedbackService, 'postNewFeedback');
    store.onSubmit();

    sinon.assert.calledWith(
      stub,
      { feedback: { username: 'taylor', comments: 'some comments' } }
    );
  });
});
