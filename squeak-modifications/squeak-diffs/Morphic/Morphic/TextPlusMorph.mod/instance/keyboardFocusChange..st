event handling
keyboardFocusChange: aBoolean

	| parent |

	"we basically ignore loss of focus unless it is going to one of our siblings"
	aBoolean ifFalse: [^self].

	paragraph isNil ifFalse:[paragraph focused: aBoolean].

	"A hand is wanting to send us characters..."
	self hasFocus ifFalse: [self editor "Forces install"].

	"Inform our siblings we have taken the focus"
	parent := self parentGeeMail ifNil: [^self].
	parent allTextPlusMorphs do: [ :each |
		each == self ifFalse: [each keyboardFocusLostForSure]
	].

