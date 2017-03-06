'use strict'

const Elm = require('./elm.js')

console.log(Elm)
let container = document.getElementById('container')
console.log(container)

// let code_as_crimescene = Elm.Main.embed(container)
let code_as_crimescene = Elm.CodeAsCrimescene.embed(container)

const ports = require('../lib/ports');

ports.init(code_as_crimescene);
// console.log(code_as_crimescene)
// code_as_crimescene.ports.check.subscribe(function(word) {
//     window.alert(word);
//     code_as_crimescene.ports.suggestions.send("from port");
// })

