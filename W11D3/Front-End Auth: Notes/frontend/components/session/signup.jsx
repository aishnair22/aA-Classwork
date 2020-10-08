import React from "react"

class Signup extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            username: "",
            email: "",
            password: ""
        }
        this.handleInput = this.handleInput.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this)
    }

    handleInput(type) { //we invoke this function so it still returns another function bc onChange takes in a cb and passes in event automatically!
        return (e) => { 
            this.setState({ [type]: e.target.value }) //[] means: type will be evaluated before it is set as the key
        }
    }

    handleSubmit(e) {
        e.preventDefault() //the default for a button in a form is to send a post request
        this.props.createNewUser(this.state)
            .then(() => this.props.history.push('/chirps')) //if a user successfully signs up, we redirect them to /chirps (homepage)
            //we are getting history because this component is wrapped in a Route
    }

    render() {
        return(
            <div className="session-form">
                <h2>Sign Up!</h2>
                <form>
                    <label>Username:
                        <input type="text" value={this.state.username} onChange={this.handleInput('username')} />
                    </label>
                    <label>Email:
                        <input type="text" value={this.state.email} onChange={this.handleInput('email')} />
                    </label>
                    <label>Password:
                        <input type="password" value={this.state.password} onChange={this.handleInput('password')} />
                    </label>
                    <button onClick={this.handleSubmit}>Sign Up</button>
                </form>
            </div>
        )
    }
}

export default Signup