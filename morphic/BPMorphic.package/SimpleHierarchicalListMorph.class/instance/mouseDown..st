event handling
mouseDown: evt 
	| _gsSqueakTemp_aMorph _gsSqueakTemp_selectors |
	_gsSqueakTemp_aMorph := self itemFromPoint: evt position.
	evt yellowButtonPressed
		ifTrue: ["First check for option (menu) click"
			(PluggableListMorph menuRequestUpdatesSelection
					and: [model okToChange])
				ifTrue: [_gsSqueakTemp_aMorph == selectedMorph
						ifFalse: [self setSelectedMorph: _gsSqueakTemp_aMorph]].
			^ self yellowButtonActivity: evt shiftPressed].
	(_gsSqueakTemp_aMorph notNil
			and: [_gsSqueakTemp_aMorph
					inToggleArea: (_gsSqueakTemp_aMorph point: evt position from: self)])
		ifTrue: [^ self toggleExpandedState: _gsSqueakTemp_aMorph event: evt].
	_gsSqueakTemp_aMorph
		ifNil: [^ super mouseDown: evt].
	_gsSqueakTemp_aMorph highlightForMouseDown.
	self setProperty: #highlightedMorph toValue: _gsSqueakTemp_aMorph.
	_gsSqueakTemp_selectors := Array
				with: #click:
				with: nil
				with: nil
				with: (self dragEnabled
						ifTrue: [#startDrag:]).
	evt hand
		waitForClicksOrDrag: self
		event: evt
		selectors: _gsSqueakTemp_selectors
		threshold: HandMorph dragThreshold