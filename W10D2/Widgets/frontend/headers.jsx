import React from "react"
import Tab from "./tab"

class Headers extends React.Component {
    constructor (props) {
        super(props);
    }


    render() {
        // let selectedTab = this.props.tabsArray[this.props.selectedIndex]
        let selected;
        const tabs = this.props.tabsArray.map((tab, idx) => {
            if (this.props.selectedIndex === idx) {
                return <Tab tab={tab} changeIndex={this.props.changeIndex} className={"selected"}/>
            } else {
                return <Tab tab={tab} changeIndex={this.props.changeIndex} className={""} />
            }
            
        })
        
        return (
            <ul className="headers">
                {tabs}
                {/* <li className={selected} onClick={this.props.changeIndex}>{this.props.tabsArray[0].title}</li>
                <li className={selected} onClick={this.props.changeIndex}>{this.props.tabsArray[1].title}</li>
                <li className={selected} onClick={this.props.changeIndex}>{this.props.tabsArray[2].title}</li> */}
            </ul>

        )
    }
}

export default Headers;

//function in tabs for clickhandler = change index
//pass that function as a prop to headers
//onClick here, use prop as the cb