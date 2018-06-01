private
step
	| _gsSqueakTemp_ext |
	brevityState = #graphic
		ifTrue: [_gsSqueakTemp_ext := self availableGraphicsExtent.
			_gsSqueakTemp_ext = lastGraphicsExtent
				ifFalse: [lastGraphicsExtent := _gsSqueakTemp_ext.
					brevityState := #needToGetGraphic.
					self changed: #contents]]