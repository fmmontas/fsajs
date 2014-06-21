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
      fsa.acceptsString(['b','c','c','c','b']).should.be.true
      fsa.acceptsString(['b','c','c','b','b']).should.be.true

    it 'should not change the given list', ->
      testSequence = ['b','c','c','c','b']
      expectedSequence = ['b','c','c','c','b']

      fsa.acceptsString(testSequence)
      testSequence.should.eql expectedSequence


