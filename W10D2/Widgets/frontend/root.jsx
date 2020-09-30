import React from "react";
import Clock from "./clock";
import Tabs from "./tabs";

const Root = () => {
    const tabsArray = [{ title: "one", content: "I am the first" }, { title: "two", content: "Second pane here"}, {title: "three", content: "Third pane here"}]
    return (
        <div>
            <Clock />
            <Tabs tabsArray={tabsArray} />
        </div>

    )
}

export default Root;