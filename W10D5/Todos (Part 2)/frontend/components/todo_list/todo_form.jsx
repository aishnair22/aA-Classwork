import React from "react"

function uniqueId() {
    return new Date().getTime();
}

class TodoForm extends React.Component {
    constructor(props) {
        super(props)
        this.receiveTodo = this.props.receiveTodo;
        this.state = {
            id: uniqueId(),
            title: "",
            body: "",
            done: false
        }
        this.handleSubmit = this.handleSubmit.bind(this);
        this.updateTitle = this.updateTitle.bind(this);
        this.updateBody = this.updateBody.bind(this);
    }

    handleSubmit() {
        event.preventDefault();
        const todo = this.state;
        this.receiveTodo(todo);
        this.setState({
            id: uniqueId(),
            title: "",
            body: "",
            done: false
        })
    }

    updateTitle () {
        this.setState({title: event.target.value})
    }

    updateBody () {
        this.setState({body: event.target.value})
    }

    render() {
        return(
            <form onSubmit={this.handleSubmit}>
                <label>Title: 
                    <input type="text" value={this.state.title} onChange={this.updateTitle}/>
                </label>
                <label>Body: 
                    <input type="text" value={this.state.body} onChange={this.updateBody}/>
                </label>
                <input type="submit" value="Add a Todo"/>
            </form>
        )
    }
}


export default TodoForm;