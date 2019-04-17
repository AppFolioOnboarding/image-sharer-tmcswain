import { expect } from 'chai';
import { describe, it, beforeEach } from 'mocha';

import FeedbackStore from '../../stores/FeedbackStore';

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
});
