export const postUser = (user) => { //user arg data is coming from our form input fields
    return $.ajax({
        method: "post",
        url: "/api/users",
        data: { user } //this is data we send to our controller from our backend as user_params
    })
}

export const postSession = (user) => {
    return $.ajax({
        method: "post",
        url: "/api/session",
        data: { user }
    })
}

export const deleteSession = () => {
    return $.ajax({
        method: "delete",
        url: "/api/session"
    })
}
