events
mouseDown: evt
	| selectors row |
	row := self rowAtLocation: evt position.

	evt yellowButtonPressed  "First check for option (menu) click"
		ifTrue: [
			(self class menuRequestUpdatesSelection and: [model okToChange]) ifTrue: [
				"Models depend on the correct selection:"
				self selectionIndex = (self modelIndexFor: row)
					ifFalse: [self changeModelSelection: (self modelIndexFor: row)]].
			
			^ self yellowButtonActivity: evt shiftPressed].
	row = 0  ifTrue: [^super mouseDown: evt].
	"self dragEnabled ifTrue: [aMorph highlightForMouseDown]."
	selectors := Array 
		with: #click:
		with: (doubleClickSelector ifNotNil:[#doubleClick:])
		with: nil
		with: (self dragEnabled ifTrue:[#startDrag:] ifFalse:[nil]).
	evt hand waitForClicksOrDrag: self event: evt selectors: selectors threshold: HandMorph dragThreshold "pixels".