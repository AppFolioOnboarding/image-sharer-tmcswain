import React from 'react';
import { expect } from 'chai';
import { shallow } from 'enzyme';

import Footer from '../../components/Footer';

describe('<Footer />', () => {
  it('renders footer message', () => {
    const wrapper = shallow(<Footer />);
    expect(wrapper.text()).equal('Copyright: AppFolio Inc. Onboarding');
    expect(wrapper.props().style.fontSize).equal('10px')
    expect(wrapper.props().className).equal('text-center')
  });

});
