import React from "react"
import ReactDom from "react-dom"
import configureStore from "./store/store"
import Root from "./components/root"
import { HashRouter, Route } from "react-router-dom";

document.addEventListener("DOMContentLoaded", () => {
    let rootEl = document.getElementById("root");
    const store = configureStore();
    ReactDom.render(<Root store={store}/>, rootEl);
   
    // window.getState = store.getState;
    // window.dispatch = store.dispatch;

})