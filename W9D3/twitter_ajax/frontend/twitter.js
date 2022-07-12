const FollowToggle = require("./follow_toggle");



$(document).ready(function() {
    const $buttons_arr = $("button.follow-toggle")
    $buttons_arr.each( (index, el) => {
        new FollowToggle(el)
    })
})