function Cat(name, owner) {
    this.name = name;
    this.owner = owner;
    
}
const sesame = new Cat("Sesame", "Nikhil");

Cat.prototype.cuteStatement = function() {
    return `${this.owner} loves ${this.name}!`
}
console.log(sesame.name);
console.log(sesame.owner);
console.log(sesame.cuteStatement());


Cat.prototype.cuteStatement = function() {
    return `Everyone loves ${Cat.name}!`
}

console.log(sesame.name);
console.log(sesame.owner);
console.log(sesame.cuteStatement());

Cat.prototype.meow = function() {
    return "Meow"
}
console.log(sesame.meow());

sesame.meow = function () { return "shmoney teammm!"}
console.log(sesame.meow());
