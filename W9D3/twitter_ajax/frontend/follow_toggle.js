class FollowToggle {
    constructor(el, e) {
        this.userId = $(el).attr("data-user_id")
        this.followState = $(el).attr("data-initial-follow-state")
        this.element = $(el)

        this.render()
        //this.handleclick(e)
        this.handleClick = this.handleClick.bind(this);
        this.element.on("click", this.handleClick);
    }

    render() {
        if (this.followState === "unfollowed") {
            this.element.text("follow")
        } else {
            this.element.text("unfollow")
        }
    }

    handleClick(e) {
        //this.element.on("submit", (e) => {
            e.preventDefault();
            console.log("handleclick function is being called!");
            if (this.followState ==="unfollowed") {
                $.ajax ({
                    url: `/users/${this.userId}/follow`,
                    type: "post",
                    dataType: "json",
                    success: () => {
                        console.log("ajax post request success");
                        this.followState = "followed";
                        this.render();
                    },
                    error: () => {
                        console.log("failed ajax post request");
                    }
                })
            } else {
                $.ajax ({
                    url: `/users/${this.userId}/follow`,
                    type: "delete",
                    dataType: "json",
                    success: () => {
                        console.log("ajax delete request sucess");
                        this.followState = "unfollowed";
                        this.render();
                    },
                    error: () => {
                        console.log("failed ajax delete request");
                    }
                })
            }

        //})
        console.log("post ajax");

    }

    // this needs to be bound because we call this.user_id within ajax. 
    // if we refer to this from an outside function, the this will not keep context and become undefined.
}


module.exports = FollowToggle