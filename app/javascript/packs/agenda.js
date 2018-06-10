import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import AgendaManager from './AgendaList/agenda_manager'

Agenda.propTypes = {
  events: PropTypes.string
}

// export function makeEvent(event){
//   return (
//     <EventListing id={event.id} key={event.id} event={event}/>
//   )
// }
export default function Agenda({events}){
  let agendaHash = JSON.parse(events)
  //let agendaEvents = agendaHash.map( (event) => {return (makeEvent(event))})
  // let eventTopic = agendaEvents.first.topic

  return (
    <div className="daily-agenda">
      <AgendaManager />
    </div>
  )
}
document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('agenda-events')
  const data = node.getAttribute('data')
  ReactDOM.render(
    <Agenda events={data}/>,
    document.body.appendChild(document.createElement('div')),
  )
})
