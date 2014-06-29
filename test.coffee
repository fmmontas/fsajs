chai = require 'chai'
sinon = require 'sinon'
sinonChai = require 'sinon-chai'
fsajs = require('./src/fsajs.coffee').fsajs

chai.should()
chai.use sinonChai

describe 'Given an fsa', ->
  describe 'when a string is given', ->
    fsa = {}

    beforeEach ->
      fsa = fsajs.createFSA()
      fsa.addState name: 'pepe', transitions:[{stateName:'other', symbol:'c'},{stateName:'otherState', symbol:'b'} ], initialState: true
      fsa.addState name: 'otherState', transitions:[{stateName:'other', symbol:'c'},{stateName:'otherState', symbol:'b'} ], finalState: true
      fsa.addState name: 'other', transitions:[{stateName:'pepe', symbol:'c'},{stateName:'otherState', symbol:'b'} ]

    it 'should determine if the fsa accepts the given string', ->
      fsa.acceptsString('bcccb').should.be.true
      fsa.acceptsString('bccbb').should.be.true
      fsa.acceptsString('cc').should.be.false
