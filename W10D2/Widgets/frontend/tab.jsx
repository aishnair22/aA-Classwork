import React from "react"

const Tab = (props) => {
    return (
        <li className={props.className} onClick={props.changeIndex}>   
            {props.tab.title}
        </li>
    )
}

export default Tab;