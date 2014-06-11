class FSA
  constructor: ->
    @states = []
    @self = this

  addState: (state)->
    #add some validation for states here.
    states.append state
    self

  acceptsString: (sequence) ->
    yes if not sequence.length
    letter = sequence[0]
    states.forEach (state) ->
      state.transitions.forEach (transition)->

fsa.createFSA = ->
  new FSA()



