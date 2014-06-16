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


  acceptsString: (sequence, state = @initialState) ->
    return yes if state.finalState and not sequence?.length
    symbol = sequence.shift()
    validStates = state.transitions?.filter((transition) -> transition.symbol is symbol)?.map (transition) -> transition.stateName
    @states.filter((state) -> _.contains(validStates, state.name)).some (possibleState) => @acceptsString(sequence, possibleState)

exports.fsajs =
  createFSA : -> new FSA()
