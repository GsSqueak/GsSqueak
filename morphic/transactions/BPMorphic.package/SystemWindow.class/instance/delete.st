open/close
delete
	| _gsSqueakTemp_thisWorld _gsSqueakTemp_sketchEditor _gsSqueakTemp_aPaintBox |
	self mustNotClose
		ifTrue: [^ self].
	model okToClose
		ifFalse: [^ self].
	_gsSqueakTemp_thisWorld := self world.
	_gsSqueakTemp_sketchEditor := self extantSketchEditor.
	self activeHand removeKeyboardListener: self.
	self isFlexed
		ifTrue: [owner delete]
		ifFalse: [super delete].
	model windowIsClosing; release.
	model := nil.
	_gsSqueakTemp_sketchEditor
		ifNotNil: [_gsSqueakTemp_sketchEditor deleteSelfAndSubordinates.
			(_gsSqueakTemp_thisWorld notNil
					and: [(_gsSqueakTemp_aPaintBox := _gsSqueakTemp_thisWorld paintBoxOrNil) notNil])
				ifTrue: [_gsSqueakTemp_aPaintBox delete]].
	SystemWindow noteTopWindowIn: _gsSqueakTemp_thisWorld