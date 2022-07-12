/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module) => {

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

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");



$(document).ready(function() {
    const $buttons_arr = $("button.follow-toggle")
    $buttons_arr.each( (index, el) => {
        new FollowToggle(el)
    })
})
})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map