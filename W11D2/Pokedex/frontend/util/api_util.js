export const fetchAllPokemon = () => {
    return $.ajax({
        method: "get",
        url: "/api/pokemon"
    })
}

export const fetchSinglePokemon = (id) => {
    return $.ajax({
        method: "get",
        url: `/api/pokemon/${id}`
    })
}