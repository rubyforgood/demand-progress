import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import AgendaManager from './AgendaList/agenda_manager'

Agenda.propTypes = {
  events: PropTypes.string
}

export default function Agenda({events}){
  let agendaHash = JSON.parse(events)

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
