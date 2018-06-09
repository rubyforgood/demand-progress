import React from 'react'
import PropTypes from 'prop-types'
import Moment from 'react-moment';
import 'moment-timezone';

export function formatSubCommitteeTitle(subcommittee_name){
  if (subcommittee_name !== undefined){
    return `<span className="committee-title col-12 col-md-8">{${subcommittee_name}</span>`
  }
}
export function formatOccurDate(occurs_at){
  return (
     <Moment format="MM/DD/YYYY hh:mm A">
        {occurs_at}
      </Moment>
  )
}

export default function Event({event}){
  let formattedSubCommittetitle = formatSubCommitteeTitle(event.subcommittee_name)
  let formattedOccursAt = formatOccurDate(event.occurs_at)
  return (
    <div className="event-listing jumbotron row">
      <div className="committee-section col-12 col-md-8">
        <span className="committee-title col-12 col-md-8">{event.committee_name}</span>
        {formattedSubCommittetitle}
      </div>
      <span className="location-section col-12 col-md-3 ">
        <div className="location-title font-weight-bold">Location</div>
        <div className="location">{event.location}</div>
      </span>
      <span className="topic col-12 col-md-8">{event.topic}</span>
      <span className="occurs-at col-12 col-md-8">
        {formattedOccursAt}
      </span>
    </div>
  )
}

Event.propTypes = {
  event: PropTypes.arrayOf({
    topic: PropTypes.string,
    occurs_at: PropTypes.string,
    location: PropTypes.string,
    committee_name: PropTypes.string,
    subcommittee_name: PropTypes.string
  })
}

Event.defaultProps = {
  event: [
    {committee_name: "This is a committee name",
    subcommittee_name: "This is a subcommittee name",
    topic: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec dui a leo mattis facilisis. Nulla eget massa vel elit ullamcorper laoreet. Nullam non ipsum imperdiet, efficitur metus vel, malesuada nisl. Curabitur laoreet, sem sit amet pellentesque tempor, est risus varius lacus, eget molestie elit ipsum a mauris.",
    location: "MVC-101",
    occurs_at: '2018-07-01 23:00:00'}
  ]

}
