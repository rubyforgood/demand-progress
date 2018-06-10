import React from 'react'

export default function TmpList({committee_names}){
  displayNames = committee_names.map( (name) => {<div>{name}</div>})
  return(
    <div>{displayNames}</div>
  )
}
