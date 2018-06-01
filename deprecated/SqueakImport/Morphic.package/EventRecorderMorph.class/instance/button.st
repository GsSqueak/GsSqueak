commands
button
	"Make a simple button interface for replay only"
	| butnCaption erm |
	butnCaption := UIManager default request: 'Caption for this butn?' translated initialAnswer: 'play' translated.
	butnCaption isEmpty ifTrue: [^ self].
	erm := (EventRecorderMorph basicNew
				caption: butnCaption
				voiceRecorder: voiceRecorder copy
				tape: tape) initialize.
	self world primaryHand attachMorph: erm