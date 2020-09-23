function GameView (game, ctx) {
    this.game = game;
    this.ctx = ctx;
}

GameView.prototype.start = function() {
    setInterval(this.play.bind(this), 500);
}

GameView.prototype.play = function() {
    this.game.draw(this.ctx);
    this.game.moveObjects();
}

module.exports = GameView;