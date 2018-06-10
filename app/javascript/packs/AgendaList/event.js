import React from "react";
import PropTypes from "prop-types";
import Moment from "react-moment";
import "moment-timezone";

const keygen = (committee_id, subcommittee_name) => {
  return `${committee_id}-${subcommittee_name}`;
};

export function formatCommitteeInfo(committee_info) {
  return committee_info.map(event => {
    let formattedSubcommitteeTitle = formatSubcommitteeTitle(
      event.subcommittee_name
    );
    return (
      <div
        key={keygen(
          event.committee_info.committee_id,
          event.committee_info.subcommittee_name
        )}
        className="committee-section col-12 col-md-8"
      >
        <span className="committee-title col-12 col-md-8">
          {event.committee_name}
        </span>
        {formattedSubcommitteeTitle}
      </div>
    );
  });
}
export function formatSubcommitteeTitle(subcommittee_name) {
  if (subcommittee_name !== undefined) {
    return (
      <span className="subcommittee-title col-12 col-md-8">
        {subcommittee_name}
      </span>
    );
  }
}
export function formatOccurDate(occurs_at) {
  return <Moment format="MM/DD/YYYY hh:mm A">{occurs_at}</Moment>;
}

export default function Event({ event }) {
  let formattedOccursAt = formatOccurDate(event.occurs_at);
  let formattedCommitteeInfo = formatCommitteeInfo(event.committee_info);
  return (
    <div key="{event.id}" className="event jumbotron row">
      {formattedCommitteeInfo}
      <span className="location-section col-12 col-md-3 ">
        <div className="location-title font-weight-bold">Location</div>
        <div className="location">{event.location}</div>
      </span>
      <span className="topic col-12 col-md-8">{event.topic}</span>
      <span className="occurs-at col-12 col-md-8">{formattedOccursAt}</span>
    </div>
  );
}

Event.propTypes = {
  event: PropTypes.shape({
    id: PropTypes.number,
    topic: PropTypes.string,
    occurs_at: PropTypes.string,
    location: PropTypes.string,
    committee_info: PropTypes.arrayOf(
      PropTypes.shape({
        committee_name: PropTypes.string,
        subcommittee_name: PropTypes.string,
        committee_id: PropTypes.string
      })
    )
  })
};

Event.defaultProps = {
  event: [
    {
      committee_info: [
        {
          committee_name: "This is a committee name",
          subcommittee_name: "This is a subcommittee name",
          committee_id: "MD-2020"
        }
      ],
      topic:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec dui a leo mattis facilisis. Nulla eget massa vel elit ullamcorper laoreet. Nullam non ipsum imperdiet, efficitur metus vel, malesuada nisl. Curabitur laoreet, sem sit amet pellentesque tempor, est risus varius lacus, eget molestie elit ipsum a mauris.",
      location: "MVC-101",
      occurs_at: "2018-07-01 23:00:00"
    }
  ]
};
