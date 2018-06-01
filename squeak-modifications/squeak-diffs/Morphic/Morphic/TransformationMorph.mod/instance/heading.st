geometry eToy
heading
	"End recusion when necessary."
	| rendee |
	(rendee := self renderedMorph) == self ifTrue: [ ^0.0 ] .
	^ rendee heading