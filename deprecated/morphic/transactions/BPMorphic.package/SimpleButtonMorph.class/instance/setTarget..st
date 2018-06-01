menu
setTarget: evt 
	| _gsSqueakTemp_rootMorphs |
	_gsSqueakTemp_rootMorphs := self world rootMorphsAt: evt hand targetPoint.
	target := _gsSqueakTemp_rootMorphs size > 1
				ifTrue: [_gsSqueakTemp_rootMorphs second]