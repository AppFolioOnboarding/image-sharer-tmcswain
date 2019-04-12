import React from 'react';
import { expect } from 'chai';
import { shallow } from 'enzyme';
import { describe, it } from 'mocha';

import App from '../../components/App';
import FeedbackForm from '../../components/FeedbackForm';
import Footer from '../../components/Footer';
import Header from '../../components/Header';

describe('<App />', () => {
  it('renders Header', () => {
    const wrapper = shallow(<App stores={{}} />).dive();
    expect(wrapper.find(Header)).to.have.length(1);
  });

  it('renders FeedbackForm', () => {
    const wrapper = shallow(<App stores={{}} />).dive();
    expect(wrapper.find(FeedbackForm)).to.have.length(1);
  });

  it('renders Footer', () => {
    const wrapper = shallow(<App stores={{}} />).dive();
    expect(wrapper.find(Footer)).to.have.length(1);
  });
});
