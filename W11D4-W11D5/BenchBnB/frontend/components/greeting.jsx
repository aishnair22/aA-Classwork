import React from "react"
import {Link} from "react-router-dom"

const Greeting = ({currentUser, logout}) => {
    const display = currentUser ? (
        <div>
            <h2>Welcome, {currentUser.username}!</h2>
            <button onClick={logout}>Logout</button>
        </div>
    ) : (
        <div>
            <Link to="/signup">Sign Up</Link>
            &nbsp;or&nbsp;
            <Link to="/login">Login</Link>
        </div>
    )

    return (
        <div>{ display }</div>
    )
}

export default Greeting