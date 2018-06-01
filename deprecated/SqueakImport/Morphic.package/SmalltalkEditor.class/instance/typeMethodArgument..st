private
typeMethodArgument: aKeyboardEvent 
	"Replace the current text selection with the name of the method argument represented by the keyCode."
	| keyCode |
	keyCode := ('1234' 
		indexOf: aKeyboardEvent keyCharacter
		ifAbsent: [1]).
	self  addString: (self methodArgument: keyCode).
	^ false