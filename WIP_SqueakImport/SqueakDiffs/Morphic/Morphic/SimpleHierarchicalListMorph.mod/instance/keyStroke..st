event handling
keyStroke: event 
	"Process potential command keys"
	
	event keyCharacter asciiValue < 32 ifTrue: [
		^ self specialKeyPressed: event keyCharacter asciiValue].
	
	" A lot of actions do not return a Boolean here (#messageListKey:from:, 
	#classListKey:from:, ...); even most #arrowKey:from: implementors do not.
	Hence, we explicitely check for false and else assume truthieness"
	^ (self keyStrokeAction: event) ~~ false
