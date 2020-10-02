import React from "react";
import ReactDom from "react-dom";
import { configureStore} from "./store/store";
import { receiveTodo, receiveTodos} from "./actions/todo_actions"
import Root from "./components/root"


document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("content");
    const store = configureStore();
    ReactDom.render(<Root store={store}/>, root);
    // the window store and receive todos are ways to test with the window console
    window.receiveTodos = receiveTodos;
    window.receiveTodo = receiveTodo;
    window.store = store;
})

//left off on Selectors