resize/collapse
getCollapsedFrame
	| _gsSqueakTemp_tmp |
	^ Preferences collapseWindowsInPlace
		ifTrue: [_gsSqueakTemp_tmp := self getBoundsWithFlex.
			_gsSqueakTemp_tmp origin corner: _gsSqueakTemp_tmp corner x @ 18]
		ifFalse: [RealEstateAgent assignCollapseFrameFor: self]