import React from "react";
import Headers from "./headers"


class Tabs extends React.Component {
    constructor(props) {
        super(props);
        this.state = {index: 0}
        this.changeIndex = this.changeIndex.bind(this);
    }

    changeIndex(e) {
        if (e.target.innerText === "one") {
            this.setState({index: 0})
        } else if (e.target.innerText === "two") {
            this.setState({ index: 1 })
        } else if (e.target.innerText === "three") {
            this.setState({ index: 2 })
        }
    }

    render() {
        const tabsArray = this.props.tabsArray;
        let content;
        if (this.state.index === 0) {
            content = tabsArray[0].content
        } else if (this.state.index === 1) {
            content = tabsArray[1].content
        } else if (this.state.index === 2) {
            content = tabsArray[2].content
        }

        return (
            <div className="tabstitle">
                <h1>Tabs</h1>
                <div className="tabs">
                    <Headers selectedIndex={this.state.index} changeIndex={this.changeIndex} tabsArray={tabsArray}/>
                    <p className="content">{content}</p>
                </div>
            </div>
        )
    }
}

export default Tabs
/* props = tabsArray
props.tabsArray[0].title  */