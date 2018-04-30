initialization
effect: effectSymbol direction: dirSymbol inverse: inverse 
	| _gsSqueakTemp_invEffect _gsSqueakTemp_invDir _gsSqueakTemp_i _gsSqueakTemp_dirSet |
	inverse
		ifFalse: [^ self effect: effectSymbol direction: dirSymbol].
	_gsSqueakTemp_invEffect := effectSymbol.
	effectSymbol = #pageForward
		ifTrue: [_gsSqueakTemp_invEffect := #pageBack].
	effectSymbol = #pageBack
		ifTrue: [_gsSqueakTemp_invEffect := #pageForward].
	effectSymbol = #slideOver
		ifTrue: [_gsSqueakTemp_invEffect := #slideAway].
	effectSymbol = #slideAway
		ifTrue: [_gsSqueakTemp_invEffect := #slideOver].
	_gsSqueakTemp_invDir := dirSymbol.
	_gsSqueakTemp_dirSet := self directionsForEffect: effectSymbol.
	(_gsSqueakTemp_i := _gsSqueakTemp_dirSet indexOf: dirSymbol) > 0
		ifTrue: [_gsSqueakTemp_invDir := _gsSqueakTemp_dirSet atWrap: _gsSqueakTemp_i + (_gsSqueakTemp_dirSet size // 2)].
	^ self effect: _gsSqueakTemp_invEffect direction: _gsSqueakTemp_invDir