import React from "react";
import ReactRedux from "react-redux";
import { combineReducers} from "redux";
import todosReducer from "./todos_reducer";


const rootReducer = combineReducers({
    todos: todosReducer
})


export default rootReducer;