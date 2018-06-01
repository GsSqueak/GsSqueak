private
adjustSubmorphPositions
	| _gsSqueakTemp_p |
	_gsSqueakTemp_p := 0 @ 0.
	scroller
		submorphsDo: [:each | | h | each visible
				ifTrue: [h := each height.
					each
						privateBounds: (_gsSqueakTemp_p extent: self preferredSubmorphWidth @ h).
					_gsSqueakTemp_p := _gsSqueakTemp_p + (0 @ h)]].
	self clearColumnsCache; changed; layoutChanged; setScrollDeltas