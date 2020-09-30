import React from 'react';
import Tile from './tile';
import Board from './board'
import * as Minesweeper from '../minesweeper.js';

class Game extends React.Component {
  constructor(){
    super()
    this.state = { board: new Minesweeper.Board(9, 10)}
    this.updateGame = this.updateGame.bind(this)
    this.restartGame = this.restartGame.bind(this)
  }

  updateGame(tile, bool){
    if (bool) {
      tile.toggleFlag()
    } else {
      tile.explore()
    }

    this.setState({ board: this.state.board })
  }

  restartGame() {
    let newBoard = new Minesweeper.Board(9, 10)    
    this.setState( { board: newBoard } )
  }

  render(){
    let alert;
    if ( this.state.board.won() ) {
      alert = (
        <div className="modal-screen">
          <div className="modal-alert">
            <p>You Won!</p>
            <button onClick={this.restartGame}>Play Again</button>
          </div>
        </div>
      );
    } else if (this.state.board.lost()) {
      alert = (
        <div className="modal-screen">
          <div className="modal-alert">
            <p>You Lost!</p>
            <button onClick={this.restartGame}>Play Again</button>
          </div>
        </div>
      );
    }

    return(
      <div>
        { alert }
        <Board board={ this.state.board } updateGame={ this.updateGame }/>
      </div>
    )
  }

}

export default Game;