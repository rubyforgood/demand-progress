import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import DailyAgenda from './AgendaList/DailyAgenda'

Agenda.propTypes = {
  events: PropTypes.string
}

// export function makeEvent(event){
//   return (
//     <EventListing id={event.id} key={event.id} event={event}/>
//   )
// }
export default function Agenda({events}){
  // let agendaEvents = events.map( (event) => {return <EventListing topic={event.topic}/>})
  let agendaHash = JSON.parse(events)
  //let agendaEvents = agendaHash.map( (event) => {return (makeEvent(event))})
  // let eventTopic = agendaEvents.first.topic

  return (
    <div className="agenda-list">
      <AgendaList />
    </div>
  )
}
document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('agenda-events')
  const data = node.getAttribute('data')
  //let agendaEvents = data.map( (event) => {return <EventListing topic={event.topic}/>})
  ReactDOM.render(
    <Agenda events={data}/>,
    document.body.appendChild(document.createElement('div')),
  )
})
