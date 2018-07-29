import React from 'react'
import PropTypes from 'prop-types'
import Event from './event'

export function foo(events, selectedCommittees){
  if (selectedCommittees.length === 0) { return events.map(event => { return <Event event={event} key={event.id} /> })}

  return events.map((event) => {
    return selectedCommittees.includes(event.committee_name) && <Event event={event} key={event.id} />
  })
}

export default function DailyAgenda({agenda_date, events, selectedCommittees}){
  let returnedEvents = foo(events, selectedCommittees);

  return(
    <div className="daily-agenda-section">
      <div>{agenda_date}</div>
      <div>{returnedEvents}</div>
    </div>
  )
}

DailyAgenda.propTypes = {
  agenda_date: PropTypes.string,
  events: PropTypes.arrayOf(PropTypes.shape({
    id: PropTypes.number,
    topic: PropTypes.string,
    occurs_at: PropTypes.string,
    location: PropTypes.string,
    committee_name: PropTypes.string,
    subcommittee_name: PropTypes.string
  })),
  selectedCommittees: PropTypes.array
}

DailyAgenda.defaultProps = {
  agenda_date: '2018-06-09',
  selectedCommittees: []
}
