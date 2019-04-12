import React from 'react';
import { expect } from 'chai';
import { mount } from 'enzyme';
import { describe, it, beforeEach } from 'mocha';

import FeedbackForm from '../../components/FeedbackForm';
import FeedbackStore from '../../stores/FeedbackStore';

describe('<FeedbackForm />', () => {
  let store;
  beforeEach(() => {
    store = new FeedbackStore();
    store.userName = 'Taylor';
    store.comments = 'Some Comments';
  });

  it('asks for a name', () => {
    const wrapper = mount(<FeedbackForm stores={{ feedbackStore: store }} />);
    expect(wrapper.find('.js-username').text()).to.equal('Your Name:');
    expect(wrapper.find('#js-username-input').props().value).to.equal('Taylor');
  });

  it('asks for comments', () => {
    const wrapper = mount(<FeedbackForm stores={{ feedbackStore: store }} />);
    expect(wrapper.find('.js-comments').text()).to.equal('Comments:');
    expect(wrapper.find('#js-comments-input').props().value).to.equal('Some Comments');
  });

  it('updates name onChange', () => {
    const wrapper = mount(<FeedbackForm stores={{ feedbackStore: store }} />);
    wrapper.find('#js-username-input').simulate('change', { target: { value: 'Boying' } });
    expect(wrapper.find('#js-username-input').props().value).to.equal('Boying');
  });

  it('updates comments onChange', () => {
    const wrapper = mount(<FeedbackForm stores={{ feedbackStore: store }} />);
    wrapper.find('#js-comments-input').simulate('change', { target: { value: 'new comments' } });
    expect(wrapper.find('#js-comments-input').props().value).to.equal('new comments');
  });
});
