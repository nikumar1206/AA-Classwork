/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroids.js":
/*!**************************!*\
  !*** ./src/asteroids.js ***!
  \**************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\")\n\n\nfunction Asteroid(options) {\n    // this.radius = 75\n    // this.color = \"pink\"\n    // this.game = options[game]\n    // this.vel = Util.randomVec(1)\n    MovingObject.call(this, options)\n} \n\nUtil.inherits(Asteroid, MovingObject);\n\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroids.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Asteroid = __webpack_require__(/*! ./asteroids */ \"./src/asteroids.js\");\nconst Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\")\nfunction Game() {\n    this.DIM_X = window.innerWidth;\n    this.DIM_Y = window.innerHeight;\n    this.NUM_ASTEROIDS = 12;\n    this.asteroids = [];\n    this.addAsteroids();\n}\n\n\nGame.prototype.addAsteroids = function() {\n    for (i = 0; i < this.NUM_ASTEROIDS; i++) {\n        let rand_x = Math.floor(Math.random() * this.DIM_X);\n        let rand_y = Math.floor(Math.random() * this.DIM_Y);\n        console.log(this);\n        let a = new Asteroid({\n            pos:[rand_x, rand_y],\n            vel: Util.randomVec(0.8),\n            radius: 55,\n            color: \"purple\",\n            game: this\n        })\n        console.log(a);\n        this.asteroids.push(a)\n    }\n}\n\nGame.prototype.draw = function(ctx) {\n    ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);\n    ctx.fillStyle = \"lightblue\";\n    ctx.fillRect(0,0, this.DIM_X, this.DIM_Y);\n    for (let i = 0 ; i < this.asteroids.length; i++) {\n        this.asteroids[i].draw(ctx)\n    }\n}\n\nGame.prototype.moveObjects = function() {\n    for (let i = 0; i< this.asteroids.length; i++) {\n        this.asteroids[i].move();\n    }\n}\n\nGame.prototype.wrap = function(pos) {\n    let x = pos[0]\n    let y = pos[1]\n    if (x > this.DIM_X + 60) {\n        pos[0] = -60\n    } else if (x < -60) {\n        pos[0] = this.DIM_X + 60\n    }\n    if (y > this.DIM_Y + 60) {\n        pos[1] = -60\n    } else if (y < -60) {\n        pos[1] = this.DIM_Y + 60\n    }\n    return pos\n}\n\nGame.prototype.checkCollisions = function() {\n    for (i = 0; i < this.asteroids; i++) {\n        for (j = 0; j < this.asteroids; j++) {\n            if (this.asteroids[j] != this.asteroids[i] && this.asteroids[i].isCollidedWith(this.asteroids[j])) {\n                alert(\"COLLISION\")\n            }\n        }\n    }\n}\n\nGame.prototype.step\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Game = __webpack_require__(/*! ./game */ \"./src/game.js\");\n\nfunction GameView(ctx) {\n    this.ctx = ctx;\n    this.game = new Game();\n}\n\nGameView.prototype.start = function() {\n    setInterval(() => {\n        this.game.draw(this.ctx)\n        this.game.moveObjects()\n    }, 0);\n}\n\nmodule.exports = GameView\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("// const MovingObject = require(\"./moving_object\");\n// const Asteroid = require(\"./asteroids\")\nconst GameView = __webpack_require__(/*! ./game_view */ \"./src/game_view.js\");\nwindow.GameView = GameView\n// window.MovingObject = MovingObject;\n// window.Asteroid = Asteroid;\n\nwindow.addEventListener('DOMContentLoaded', (event) => {\n    const canvasEl = document.getElementById(\"canvas\");\n    canvasEl.width = window.innerWidth;\n    canvasEl.height = window.innerHeight;\n\n    const ctx = canvasEl.getContext(\"2d\");\n\n    ctx.fillStyle = \"lightblue\";\n    ctx.fillRect(0, 0, canvasEl.width, canvasEl.height);\n\n    // first_moving_object.draw(ctx)\n    // a1.draw(ctx)\n    const gameview1 = new GameView(ctx);\n    // console.log(gameview1);\n    gameview1.start();\n})\n\n// first_moving_object = new MovingObject({\n//     pos: [400,220],\n//     vel: [2,3],\n//     radius: 50,\n//     color: \"green\"\n// })\n\n// a1 = new Asteroid([100,100])\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("function MovingObject(options) {\n    this.pos = options.pos\n    this.vel = options.vel\n    this.radius = options.radius\n    this.color = options.color\n    this.game = options.game\n}\nMovingObject.prototype.draw = function(ctx) {\n    ctx.beginPath();\n    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, Math.PI * 2, false);\n    ctx.fillStyle = this.color;\n    ctx.fill();\n    ctx.lineWidth = 5;\n    ctx.strokeStyle = this.color;\n    ctx.stroke();\n}\n\nMovingObject.prototype.move = function() {\n    console.log(this.pos);\n    this.pos[0] += this.vel[0]\n    this.pos[1] += this.vel[1]\n    this.pos = this.game.wrap(this.pos)\n}\n\nMovingObject.prototype.isCollidedWith= function(otherObject) {\n    let distance = sqrt((this.pos[0] - otherObject.pos[0]) ** 2 + (this.pos[1] - otherObject.pos[1]) ** 2)\n    let acc_for_radi = distance - (2 * this.radius)\n    if (acc_for_radi < 0) {\n        return true\n    }\n    return false\n}\n\n\nmodule.exports = MovingObject;\n\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/***/ ((module) => {

eval("const Util = {\n    inherits(child, parent) {\n        function Surrogate() {};\n        Surrogate.prototype = parent.prototype;\n        child.prototype = new Surrogate();\n        child.prototype.constructor = child;\n    },\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n      },\n      // Scale the length of a vector by the given amount.\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    }\n};\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/utils.js?");

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
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;