displaying
showWhile: aBlock 
	"While evaluating the argument, aBlock, make the receiver be the cursor shape."
	"ar 2/2/2006: Only allow this if active process is ui process"
	| oldcursor |
	Processor activeProcess == Project uiProcess ifFalse:[^aBlock value].
	oldcursor := Cursor currentCursor.
	self show.
	^aBlock ensure: [oldcursor show]
