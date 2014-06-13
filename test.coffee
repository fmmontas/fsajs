chai = require 'chai'
sinon = require 'sinon'
sinonChai = require 'sinon-chai'
require 'coffee-script/register'
fsajs = require('./fsa.coffee').fsajs

chai.should()
chai.use sinonChai

describe 'Given an fsa', ->
  describe 'when a string is given', ->
    it 'should determine if the fsa accepts the given string', ->
      fsa = fsajs.createFSA()
      fsa.addState name: 'pepe', transitions:[{stateName:'other', symbol:'c'},{stateName:'otherState', symbol:'b'} ], initialState: true
      fsa.addState name: 'otherState', transitions:[{stateName:'other', symbol:'c'},{stateName:'otherState', symbol:'b'} ], finalState: true

      fsa.acceptsString(['b']).should.be.true
