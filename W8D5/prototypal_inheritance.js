// Function.prototype.inherits = function(SuperClass) {
//     function Surrogate() {};
//     Surrogate.prototype = SuperClass.prototype;
//     this.prototype = new Surrogate();
//     this.prototype.constructor = this;
//     }

//     function MovingObject (speed, direction, size) {
//         this.speed = speed;
//         this.direction = direction
//         this.size = size
//     }
//     function Ship () {}
//     Ship.inherits(MovingObject);

//     function Asteroid () {}
//     Asteroid.inherits(MovingObject);    

//     ship1 = new Ship()
//     ship1.speed=20
//     console.log(ship1.speed)

    Function.prototype.inherits = function(SuperClass) {
        this.prototype = Object.create(SuperClass);
        this.prototype.constructor = this;
        }
    
        function MovingObject (speed, direction, size) {
            this.speed = speed;
            this.direction = direction
            this.size = size
        }
        function Ship () {}
        Ship.inherits(MovingObject);
    
        function Asteroid () {}
        Asteroid.inherits(MovingObject);    
    
        ship1 = new Ship()
        ship1.speed=20
        console.log(ship1.speed)