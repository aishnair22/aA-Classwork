import React from 'react';
import Tile from './tile';

class Board extends React.Component {
    constructor(props) {
        super(props);
    }

    generateTiles(row) {
        return row.map((tile, idx) => {
            return <div key={idx}> 
                <Tile tile={tile} updateGame={this.props.updateGame}/>
            </div>
        })
    }

    generateRows () {
      let grid = this.props.board.grid;
      let rows = grid.map((row, idx) => {
        return <div key={idx}>
            {this.generateTiles(row)}
        </div>
      })
      return rows
    }

    render() {
        return(
            <div className="board">
                { this.generateRows() }
            </div>
        ) 
    }

}

export default Board;
