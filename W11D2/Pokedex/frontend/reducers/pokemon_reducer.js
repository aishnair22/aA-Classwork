import { RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON} from '../actions/pokemon_actions';

const pokemonReducer = (state = {}, action) => {
    Object.freeze(state);
    let newState = Object.assign({}, state);

    switch(action.type) {
        case RECEIVE_ALL_POKEMON: 
            newState = action.pokemon
            return newState
        case RECEIVE_SINGLE_POKEMON:
            newState[action.payload.pokemon.id] = action.payload.pokemon
            return newState
        default: 
            return state;
    }
} 


export default pokemonReducer
