private
messageListKey: aChar from: view 
	"Respond to a Command key. Cmd-D means re-run block."

	aChar == $d ifTrue: [ ^Cursor execute showWhile: block ].
	^super messageListKey: aChar from: view