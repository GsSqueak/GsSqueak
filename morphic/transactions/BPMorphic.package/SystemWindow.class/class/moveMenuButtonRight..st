preferences
moveMenuButtonRight: aBoolean 
	| _gsSqueakTemp_absLeftOffset |
	_gsSqueakTemp_absLeftOffset := ((self hideExpandButton
					and: [aBoolean])
				ifTrue: [_gsSqueakTemp_absLeftOffset := self boxExtent x * 2]
				ifFalse: [_gsSqueakTemp_absLeftOffset := self boxExtent x])
				+ 3.
	self menuBoxFrame
		leftOffset: (aBoolean
				ifTrue: [_gsSqueakTemp_absLeftOffset negated]
				ifFalse: [_gsSqueakTemp_absLeftOffset]).
	self refreshAllWindows