import { describe, it } from 'mocha';
import sinon from 'sinon';
import * as API from '../../utils/helper';

import PostFeedbackService from '../../services/PostFeedbackService';

describe('PostFeedbackService', () => {
  it('posts Feedback', () => {
    const stub = sinon.stub(API, 'post');
    PostFeedbackService.postNewFeedback({ feedback: { username: 'Taylor', comments: 'some comments' } });
    sinon.assert.calledWith(
      stub,
      'http://localhost:3000/api/feedbacks', { feedback: { username: 'Taylor', comments: 'some comments' } }
    );
  });
});
