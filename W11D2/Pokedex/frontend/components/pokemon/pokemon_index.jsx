import React from "react"
import PokemonIndexItem from "./pokemon_index_item"

class PokemonIndex extends React.Component {
    constructor(props) {
        super(props)
    }

    componentDidMount() {
        this.props.requestAllPokemon()
    }

    render() {
        const pokemonlist = this.props.pokemon
        return (
            <section className="pokedex">
                <ul>
                    {pokemonlist.map((pokemon) => {
                        return <PokemonIndexItem key={pokemon.id} pokemon={pokemon} />
                    })}
                </ul>
            </section>
        )
    }
}

export default PokemonIndex