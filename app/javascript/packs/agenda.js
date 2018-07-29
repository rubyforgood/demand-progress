import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import { sample } from 'lodash'
import AgendaManager from './AgendaList/agenda_manager'

const COMMITTEE_NAMES = ["Committee One", "Committee Two", "Committee Three"]

const injectCommitteeName = (event) => {
  return { ...event, committee_name: sample(COMMITTEE_NAMES) }
}

export default function Agenda({events}){
  let agendaHash = JSON.parse(events)
  agendaHash = agendaHash.map(injectCommitteeName)

  return (
    <div className="daily-agenda">
      <AgendaManager events={agendaHash} />
    </div>
  )
}

Agenda.propTypes = {
  events: PropTypes.string
}

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('agenda-events')
  const data = node.getAttribute('data')
  ReactDOM.render(
    <Agenda events={data}/>,
    document.body.appendChild(document.createElement('div')),
  )
})
