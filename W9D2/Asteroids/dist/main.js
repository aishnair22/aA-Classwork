/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\n\nconst DEFAULT = {\n    COLOR: \"teal\",\n    RADIUS: 5\n}\n\nfunction Asteroid(options) {\n    MovingObject.call(this, options);\n\n    this.color = DEFAULT.COLOR;\n    this.radius = DEFAULT.RADIUS;\n    // this.pos = options.pos;\n    this.vel = Util.randomVec(50);\n\n}\n\nUtil.inherits(Asteroid, MovingObject);\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\n\nfunction Game() {\n    this.DIM_X = 500;\n    this.DIM_Y = 500;\n    this.NUM_ASTEROIDS = 1000;\n    this.asteroids = [];\n    this.addAsteroids();\n}\n\nGame.prototype.addAsteroids = function () {\n    for (let i = 0; i < this.NUM_ASTEROIDS; i++) {\n        let newPos = this.randomPosition();\n        newAst = new Asteroid({ pos: newPos});\n        this.asteroids.push(newAst);\n    }\n};\n\nGame.prototype.randomPosition = function () {\n    let newX = Math.random() * this.DIM_X;\n    let newY = Math.random() * this.DIM_Y;\n    return [newX, newY];\n};\n\nGame.prototype.draw = function(ctx) {\n    // context.clearRect(x,y,width,height);\n    ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);\n    // ctx.fillStyle = \"blue\";\n    // ctx.fillRect(0, 0, this.DIM_X, this.DIM_Y);\n    this.asteroids.forEach (ele => {\n        ele.draw(ctx);\n    })\n}\n\nGame.prototype.moveObjects = function() {\n    this.asteroids.forEach(ele => {\n        ele.move();\n    })\n}\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function GameView (game, ctx) {\n    this.game = game;\n    this.ctx = ctx;\n}\n\nGameView.prototype.start = function() {\n    setInterval(this.play.bind(this), 500);\n}\n\nGameView.prototype.play = function() {\n    this.game.draw(this.ctx);\n    this.game.moveObjects();\n}\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("document.addEventListener(\"DOMContentLoaded\", function () {\n    const myCanvas = document.getElementById(\"game-canvas\");\n    myCanvas.width = 500;\n    myCanvas.height = 500; \n\n    const context = myCanvas.getContext(\"2d\");\n    window.ctx = context;\n    let game = new Game();\n    // game.draw(ctx);\n    // window.game = game;\n    let gameview = new GameView(game, context);\n    gameview.start();\n});\n\nconsole.log(\"Webpack is working!\")\n\n\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nwindow.MovingObject = MovingObject;\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nwindow.Asteroid = Asteroid;\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\nwindow.Game = Game;\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\nwindow.GameView = GameView;\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function MovingObject(options) {\n    this.pos = options.pos;\n    this.vel = options.vel;\n    this.radius = options.radius;\n    this.color = options.color;\n}\n\nMovingObject.prototype.draw = function(ctx) {\n    ctx.beginPath();\n    // ctx.arc(x, y, radius, startAngle, endAngle[, anticlockwise]);\n    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);\n    ctx.fillStyle = this.color;\n    ctx.fill();\n};\n\nMovingObject.prototype.move = function() {\n    newFirst = this.pos[0] + this.vel[0];\n    newSecond = this.pos[1] + this.vel[1];\n    this.pos = [newFirst, newSecond];\n};\n\n// const mo = new MovingObject({\n//     pos: [30, 30],\n//     vel: [10, 10],\n//     radius: 5,\n//     color: \"#00FF00\"\n// });\n\n// mo.draw(ctx);\n// console.log(mo);\n\nmodule.exports = MovingObject;\n\n\n// Phase III: Draw a Circle\n// To draw the circle:\n\n// Invoke beginPath with no arguments\n// Invoke arc with the appropriate dimensions to draw a circle\n// Pick a color to set as strokeStyle\n// Set the lineWidth attribute to some integer\n// Invoke stroke with no arguments\n// Open index.html in your browser to view it\n// To fill in the circle:\n\n// Pick a color to set as fillStyle\n// Invoke fill with no arguments\n// Open index.html in your browser to view it\n\n// const canvas = document.querySelector('canvas');\n// const ctx = canvas.getContext('2d');\n\n// ctx.beginPath();\n// ctx.arc(100, 75, 50, 0, 2 * Math.PI);\n// ctx.stroke();\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = {\n    inherits(childClass, parentClass) {\n        // let Surrogate = function () {};\n        function Surrogate() {};\n        Surrogate.prototype = parentClass.prototype;\n        childClass.prototype = new Surrogate();\n        childClass.prototype.constructor = childClass;\n    },\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n    // Scale the length of a vector by the given amount.\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    }\n};\n\nmodule.exports = Util;\n\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ });