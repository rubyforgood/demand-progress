import React from 'react'
import PropTypes from 'prop-types'

export default function EventListing({event}){
  return (
    <div className="event-listing jumbotron row">
      {/* I think that we'll need a Committee title format component */}
      <span className="committe-title col-12 col-md-8">{event.committee_name}: {event.subcommittee_name}</span>
      <span className="location-section col-12 col-md-3 ">
        <div className="location-title font-weight-bold">Location</div>
        <div className="location">{event.location}</div>
      </span>

      <span className="topic col-12 col-md-8">{event.topic}</span>
      <span className="occurs-at col-12 col-md-8">{event.occurs_at}</span>
    </div>
  )
}

EventListing.propTypes = {
  event: PropTypes.arrayOf({
    topic: PropTypes.string,
    occurs_at: PropTypes.string,
    location: PropTypes.string,
    committee_name: PropTypes.string,
    subcommittee_name: PropTypes.string
  })
}

EventListing.defaultProps = {
  event: [
    {committee_name: "This is a committee name",
    subcommittee_name: "This is a subcommittee name",
    topic: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec dui a leo mattis facilisis. Nulla eget massa vel elit ullamcorper laoreet. Nullam non ipsum imperdiet, efficitur metus vel, malesuada nisl. Curabitur laoreet, sem sit amet pellentesque tempor, est risus varius lacus, eget molestie elit ipsum a mauris.",
    location: "MVC-101",
    occurs_at: '2018-07-01 23:00:00'}
  ]

}
