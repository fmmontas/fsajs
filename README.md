fsajs
=====

Library for creating finite state automata and testing if they accept a given string.

```coffeescript
fsajs = require('fsajs').fsajs # import the module

fsa = fsajs.createFSA() # configure fsa
	.addState 
	  name: 'pepe' 
	  transitions:[{stateName:'other', symbol:'c'},{stateName:'otherState', symbol:'b'} ]
	  initialState: true
	.addState 
	  name: 'otherState', 
	  transitions:[{stateName:'other', symbol:'c'},{stateName:'otherState', symbol:'b'} ], 
	  finalState: true
	.addState 
	  name: 'other', 
	  transitions:[{stateName:'pepe', symbol:'c'},{stateName:'otherState', symbol:'b'} ] 

fsa.acceptsString(['b','c','c','c','b']) # returns true 

fsa.acceptsString(['b','c','c','b','b']) # returns false 
```
