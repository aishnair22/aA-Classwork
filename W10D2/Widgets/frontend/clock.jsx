import React from "react";

class Clock extends React.Component {
    constructor(props) {
        super(props);
        this.state = {time: new Date()};
        this.tick = this.tick.bind(this);
    }
    
    componentDidMount() {
        this.interval = setInterval(this.tick, 1000)
    }

    componentWillUnmount() {
        clearInterval(this.interval);
    }

    tick() {
        this.setState({time: new Date()})
    }

    render() {
        let hours = this.state.time.getHours();
        let minutes = this.state.time.getMinutes();
        let seconds = this.state.time.getSeconds();
        let date = this.state.time.toDateString();
        return (
            <div className="clock">
                <h1>Clock</h1>
                <div className="dateTime">
                    <div className="time">
                        <p>Time:</p>
                        <p>{hours}:{minutes}:{seconds} PDT</p>
                    </div>
                    <br/>
                    <div className = "date">
                        <p>Date:</p>
                        <p>{date}</p>
                    </div>
                </div>
            </div>
        )
    }
}

export default Clock;