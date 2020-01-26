import React from 'React'
import {Switch, Route, withRouter} from 'react-router-dom'

function __FileSlug__({globals}) {
  return (
    <Switch>
      <Route path="/" render={p=>
        withRouter(<Component {...p} {...globals} />)
      }/>
    </Switch>
  )
} 

export default __FileSlug__
