import React from "react";

class Tile extends React.Component {
    constructor(props) {
        super(props);
        // this.tile = this.props.tile //NEVER DO THIS WE WERE TYING THE STATE OF OUR TILE TO THE CONSTRUCTOR. it never hits the constructor again unless you refresh the page.
        this.updateGame = this.props.updateGame;
        this.generateTile = this.generateTile.bind(this)
        this.handleClick = this.handleClick.bind(this)
    }

    handleClick() {
        event.preventDefault();
        let bool = false;
        if (event.altKey) {
          bool = true
        }

        this.updateGame(this.props.tile, bool);
    }

    generateTile() {
        debugger;
        if (this.props.tile.bombed && this.props.tile.explored) {
            return (
                <button className="bombed">
                    &#128163;
                </button>
            );
        } else if (this.props.tile.flagged) {
            return (
                <button className="flagged">
                    &#128681;
                </button>
            );
        } else if (this.props.tile.explored) {
            return (
                <button className="explored">
                    {this.props.tile.adjacentBombCount()}
                </button>
            );
        } else {
            return (<div></div>)
        }
    }

    render() {
        return (
          <div className="tile" onClick={this.handleClick}>
            {this.generateTile()}
          </div>
        );
    }
}

export default Tile;