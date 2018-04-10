resize/collapse
paneWithLongestSide: sideBlock near: aPoint 
	| _gsSqueakTemp_thePane _gsSqueakTemp_theSide _gsSqueakTemp_theLen |
	_gsSqueakTemp_theLen := 0.
	paneMorphs
		do: [:pane | 
			| box |
			box := pane bounds.
			box
				forPoint: aPoint
				closestSideDistLen: [:side :dist :len | (dist <= 5
							and: [len > _gsSqueakTemp_theLen])
						ifTrue: [_gsSqueakTemp_thePane := pane.
							_gsSqueakTemp_theSide := side.
							_gsSqueakTemp_theLen := len]]].
	sideBlock value: _gsSqueakTemp_theSide.
	^ _gsSqueakTemp_thePane