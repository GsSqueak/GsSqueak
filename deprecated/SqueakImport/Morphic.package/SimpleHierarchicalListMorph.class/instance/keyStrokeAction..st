event handling
keyStrokeAction: event 

	| numArgs |
	keystrokeActionSelector ifNil: [^false].
	
	numArgs := keystrokeActionSelector numArgs.
	
	numArgs = 1 ifTrue: [
		^ model
			perform: keystrokeActionSelector
			with: event keyCharacter].
	numArgs = 2 ifTrue: [
		^ model 
			perform: keystrokeActionSelector
			with: event keyCharacter
			with: self].
	numArgs = 3 ifTrue: [
		^ model 
			perform: keystrokeActionSelector
			with: event keyCharacter
			with: self
			with: event].
	^self error: 'The keystrokeActionSelector must be a 1-, 2-, or 3-keyword symbol'