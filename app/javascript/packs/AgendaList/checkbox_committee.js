import React, { Component, PropTypes } from 'react';

class CheckboxCommittee extends Component {
  state = {
    isChecked: false
  }

  toggleCheckboxCommitteeChange = () => {
    const { handleCheckboxCommitteeChange, label } = this.props;
    const { isChecked } = this.state

    const newState = isChecked ? false : true
    this.setState({ isChecked: newState })

    handleCheckboxCommitteeChange(label, newState);
  }

  render() {
    const { label } = this.props;
    const { isChecked } = this.state;

    return (
      <div className="CheckboxCommittee">
        <label>
          <input
            type="Checkbox"
            value={label}
            checked={isChecked}
            onChange={this.toggleCheckboxCommitteeChange} />
          {label}
        </label>
      </div>
    );
  }
}

CheckboxCommittee.propTypes = {
  label: PropTypes.string,
  handleCheckboxCommitteeChange: PropTypes.func
}

export default CheckboxCommittee;
