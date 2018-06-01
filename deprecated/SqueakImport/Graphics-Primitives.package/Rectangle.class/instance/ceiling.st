truncation and round off
ceiling
	"Answer the integer rectange to the bottom right of receiver.
	Return reciever if it already and integerRectange."

	self isIntegerRectangle ifTrue: [ ^ self ] .

	^origin ceiling corner: corner ceiling