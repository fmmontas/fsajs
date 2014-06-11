chai = require 'chai'
sinon = require 'sinon'
sinonChai = require 'sinon-chai'
require 'coffee-script/register'
fsajs = require './fsa.coffee'

chai.should()
chai.use sinonChai

describe 'Given an fsa', ->
  describe 'when a string is given', ->
    it 'should determine if the fsa accepts the given string', ->
      fsajs.createFSA().addState(name: 'pepe', transitions:[{stateName:'other', symbol:'b'}]).acceptsString ['b']



