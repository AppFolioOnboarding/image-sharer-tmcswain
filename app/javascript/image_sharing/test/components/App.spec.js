import React from 'react';
import { expect } from 'chai';
import { shallow } from 'enzyme';
import { describe, it } from 'mocha';

import App from '../../components/App';
import Header from '../../components/Header';
import Footer from '../../components/Footer';

describe('<App />', () => {
  it('renders Header', () => {
    const wrapper = shallow(<App stores={{}} />).dive();
    expect(wrapper.find(Header)).to.have.length(1);
  });

  it('renders Footer', () => {
    const wrapper = shallow(<App stores={{}} />).dive();
    expect(wrapper.find(Footer)).to.have.length(1);
  });
});
