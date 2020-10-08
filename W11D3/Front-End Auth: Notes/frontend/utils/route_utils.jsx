import React from "react"
import { connect } from "react-redux"
import { Redirect, Route, withRouter} from "react-router-dom"

const mapStateToProps = (state) => {
    return({
        loggedIn: Boolean(state.session.currentUser) //whether or not we are logged in (have a currentUser)
    })
}

//auth route: redirect our users to homepage if they are logged in and they are trying to access login/sign up

//<AuthRoute path="" component={}/> <<< this is how we get the path and component args
const Auth = ({loggedIn, path, component: Component}) => { //component: Component is a way of destructuring a variable. Whenever we say Component, we are accessing component
    return(
        <Route 
            path={path} 
            render={(props) => (
                loggedIn ? <Redirect to="/" /> : <Component {...props}/>
            )}
        />
    )
}

//protected route: redirect our users to sign up page if they are not logged in and they are trying to access the chirps page

const Protected = ({loggedIn, path, component: Component}) => {
    return(
        <Route
            path={path}
            render={(props) => (
                loggedIn ? <Component {...props}/> : <Redirect to="/signup"/>
            )}
        />
    )
}

export const AuthRoute = withRouter(connect(mapStateToProps)(Auth)) //gives Auth access to match, location, history even though it isn't wrapped in a Route
export const ProtectedRoute = withRouter(connect(mapStateToProps)(Protected)) //think of Protected Route as a Container for Protected Component!
