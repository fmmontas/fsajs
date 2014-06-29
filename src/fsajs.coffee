_ = require 'underscore'

class FSA
  constructor: ->
    @states = []
    @finalStates = []
    @initialState
    @self = this

  addState: (state)->
    #add some validation for states here.
    @states.push state
    @initialState = state if state.initialState
    @finalStates.push state if state.finalState
    @self


  acceptsString: (string) ->
    sequence = string.split ''

    acceptsStringInternal =  (sequence, state) =>
      return yes if state.finalState and not sequence?.length
      sequence = sequence.slice 0
      symbol = sequence.shift()
      validStates = state.transitions?.filter((transition) -> transition.symbol is symbol)?.map (transition) -> transition.stateName
      @states.filter((state) -> _.contains(validStates, state.name)).some (possibleState) -> acceptsStringInternal(sequence, possibleState)

    acceptsStringInternal(sequence, @initialState)

exports.fsajs =
  createFSA : -> new FSA()
