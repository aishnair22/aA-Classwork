import { connect } from "react-redux";
import { selectAllPokemon } from "../../reducers/selectors"
import { requestAllPokemon } from "../../actions/pokemon_actions"
import PokemonIndex from "../../components/pokemon/pokemon_index"

const mapStateToProps = (state) => {
    return({
        pokemon: selectAllPokemon(state)
    }) 
}

const mapDispatchToProps = (dispatch) => {
    return ({
        requestAllPokemon: () => (dispatch(requestAllPokemon())) //make sure to make the value a function! invoke them in the component
    }) 
}


export default connect(mapStateToProps, mapDispatchToProps)(PokemonIndex)