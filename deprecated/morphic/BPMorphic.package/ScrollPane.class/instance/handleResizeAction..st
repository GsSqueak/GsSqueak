geometry
handleResizeAction: aBlock
  "Ensure layout properties after resizing takes place."

  | _gsSqueakTemp_oldExtent |
  _gsSqueakTemp_oldExtent := self extent.
  aBlock value
    ifFalse: [ ^ self ]	"Now reset widget sizes"	"self extent ~= _gsSqueakTemp_oldExtent
		ifTrue: [self resizeScrollBars; resizeScroller; setScrollDeltas]"