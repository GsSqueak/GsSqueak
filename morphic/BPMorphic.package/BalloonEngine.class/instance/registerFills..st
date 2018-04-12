drawing
registerFills: fills 
	| _gsSqueakTemp_fillIndexList _gsSqueakTemp_index _gsSqueakTemp_fillIndex |
	((colorTransform notNil
				and: [colorTransform isAlphaTransform])
			or: [fills
					anySatisfy: [:any | any notNil
							and: [any isTranslucent]]])
		ifTrue: [self flush.
			self reset.
			postFlushNeeded := true].
	_gsSqueakTemp_fillIndexList := WordArray new: fills size.
	_gsSqueakTemp_index := 1.
	[_gsSqueakTemp_index <= fills size]
		whileTrue: [_gsSqueakTemp_fillIndex := self
						registerFill: (fills at: _gsSqueakTemp_index).
			_gsSqueakTemp_fillIndex == nil
				ifTrue: [_gsSqueakTemp_index := 1
					"Need to start over"]
				ifFalse: [_gsSqueakTemp_fillIndexList at: _gsSqueakTemp_index put: _gsSqueakTemp_fillIndex.
					_gsSqueakTemp_index := _gsSqueakTemp_index + 1]].
	^ _gsSqueakTemp_fillIndexList