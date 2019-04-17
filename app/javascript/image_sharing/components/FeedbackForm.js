import React, { Component } from 'react';
import { inject, observer } from 'mobx-react';

@inject('stores')
@observer
class FeedbackForm extends Component {
  render() {
    return (
      <div>
        <form>
          <div>
            <label className='js-username' htmlFor='js-username-input'>
              Your Name:
              <input
                id='js-username-input'
                value={this.props.stores.feedbackStore.userName}
                onChange={e => this.props.stores.feedbackStore.setUserName(e.target.value)}
              />
            </label>
          </div>
          <div>
            <label className='js-comments' htmlFor='js-comments-input'>
              Comments:
              <input
                id='js-comments-input'
                value={this.props.stores.feedbackStore.comments}
                onChange={e => this.props.stores.feedbackStore.setComments(e.target.value)}
              />
            </label>
          </div>
          <input type="submit" value="Submit" />
        </form>
      </div>
    );
  }
}

export default FeedbackForm;
