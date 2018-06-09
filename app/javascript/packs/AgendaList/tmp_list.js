import React from 'react'

export default function TmpList({committee_names}){
  displayNames = committee_names.map( (name) => return {<div>{name}</div>})
  return(
    <div>{displayNames}</div>
  )
}
