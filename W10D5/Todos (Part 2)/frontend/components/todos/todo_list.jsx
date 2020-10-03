import React from "react";
import { TodoListItem } from "./todo_list_item"
import TodoForm from "../todo_list/todo_form"

export const todoList = (props) => {
    return (
        <div>
            <ul>
                {props.todos.map((todo) => {
                    // Key needs to be defined on this part not the inner part
                    // for whatever reason
                    return <TodoListItem key={todo.id} todoitem={ todo } />
                })}
            </ul>
            <TodoForm receiveTodo={props.receiveTodo} />
        </div>      
    )
}


// // This way is with forEach, you have to save to an external array
// // And then return it at the end of the ul
// export const todoList = ({ todos }) => {
//     let todoArr = []
//     return (
//         <ul>
//             {todos.forEach((todo) => {
//                 todoArr.push(
//                     <li>
//                         {todo.title}
//                     </li>
//                 )
//             })}
//             {todoArr}
//         </ul>
//     )
// }