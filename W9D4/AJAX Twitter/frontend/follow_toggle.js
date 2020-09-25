const APIUtil = require("./api_util.js")


class FollowToggle {
    constructor(el) {
        this.$el = $(el);
        this.userId = this.$el.data("user-id");
        this.followState = this.$el.data("initial-follow-state");
        
        this.render();
        this.$el.on('click', this.handleClick.bind(this));    //.on takes in an event, and an UNINVOKED function
        // this.$el.on('click', (e) => {
        //     this.handleClick(e);
        // });
    }

    render() {
        if (this.followState === false) {
            this.$el.text("Follow!");
        } else {
            this.$el.text("Unfollow!");
        }
    }

    handleClick(e) {
        e.preventDefault()
        debugger;
        let that = this
        if ( this.followState === false) {
            debugger;
            APIUtil.followUser(this.userId).then( () => {
                debugger;
                that.followState = true;
                that.render();               
            })
        } else if (this.followState === true){
            debugger;
            APIUtil.unfollowUser(this.userId).then( () => {
                debugger;
                that.followState = false;
                that.render();
            })
        }
    }
}

module.exports = FollowToggle;