new selection
correctFrom: start to: stop with: aString 
	"Make a correction in the model that the user has authorised from
	somewhere else in the system (such as from the compilier). The user's
	selection is not changed, only corrected."
	| _gsSqueakTemp_userSelection _gsSqueakTemp_delta _gsSqueakTemp_loc _gsSqueakTemp_wasShowing |
	aString = '#insert period'
		ifTrue: [_gsSqueakTemp_loc := start.
			[(_gsSqueakTemp_loc := _gsSqueakTemp_loc - 1) > 0
				and: [(paragraph string at: _gsSqueakTemp_loc) isSeparator]]
				whileTrue: [_gsSqueakTemp_loc := _gsSqueakTemp_loc - 1].
			^ self
				correctFrom: _gsSqueakTemp_loc + 1
				to: _gsSqueakTemp_loc
				with: '.'].
	(_gsSqueakTemp_wasShowing := selectionShowing)
		ifTrue: [self reverseSelection].
	_gsSqueakTemp_userSelection := self selectionInterval.
	self selectInvisiblyFrom: start to: stop.
	self replaceSelectionWith: aString.
	_gsSqueakTemp_delta := aString size - (stop - start + 1).
	self selectInvisiblyFrom: _gsSqueakTemp_userSelection first
			+ (_gsSqueakTemp_userSelection first > start
					ifTrue: [_gsSqueakTemp_delta]
					ifFalse: [0]) to: _gsSqueakTemp_userSelection last
			+ (_gsSqueakTemp_userSelection last > start
					ifTrue: [_gsSqueakTemp_delta]
					ifFalse: [0]).
	_gsSqueakTemp_wasShowing
		ifTrue: [self reverseSelection]