events
mouseDown: evt 
	| _gsSqueakTemp_selectors _gsSqueakTemp_row |
	_gsSqueakTemp_row := self rowAtLocation: evt position.
	evt yellowButtonPressed
		ifTrue: ["First check for option (menu) click"
			(self class menuRequestUpdatesSelection
					and: [model okToChange])
				ifTrue: ["Models depend on the correct selection:"
					self selectionIndex
							= (self modelIndexFor: _gsSqueakTemp_row)
						ifFalse: [self
								changeModelSelection: (self modelIndexFor: _gsSqueakTemp_row)]].
			^ self yellowButtonActivity: evt shiftPressed].
	_gsSqueakTemp_row = 0
		ifTrue: [^ super mouseDown: evt].
	"self dragEnabled ifTrue: [aMorph highlightForMouseDown]."
	_gsSqueakTemp_selectors := Array
				with: #click:
				with: (doubleClickSelector
						ifNotNil: [#doubleClick:])
				with: nil
				with: (self dragEnabled
						ifTrue: [#startDrag:]).
	evt hand
		waitForClicksOrDrag: self
		event: evt
		selectors: _gsSqueakTemp_selectors
		threshold: HandMorph dragThreshold