import React from "react";

export const TodoListItem = ({todoitem}) => {
    return (
        <li>
            {todoitem.title}
        </li>
    )
}