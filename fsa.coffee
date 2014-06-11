class FSA
  constructor: ->
    @states = []
    @initialState
    @self = this

  addState: (state)->
    #add some validation for states here.
    states.push state
    initialState = state unless initialState
    self

  acceptsString: (sequence, state = @initialState) ->
    yes unless sequence?.length
    symbol = sequence.shift()
    validStates = state.transitions?.filter((transition) -> transition.symbol is symbol)?.map (transition) -> transition.stateName
    @states.filter((state) -> validStates?.contains(state.name))?.some (possibleState) -> acceptsString(sequence, possibleState)

exports.fsajs = ->
  createFSA : -> new FSA()



