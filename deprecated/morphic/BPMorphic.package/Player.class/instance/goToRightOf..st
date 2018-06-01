scripts-standard
goToRightOf: aPlayer 
	"Place the object so that it lies directly to the right of the given object"
	| _gsSqueakTemp_hisCostume _gsSqueakTemp_aCostume |
	(aPlayer isNil
			or: [aPlayer == self])
		ifTrue: [^ self].
	(_gsSqueakTemp_hisCostume := aPlayer costume) isInWorld
		ifFalse: [^ self].
	_gsSqueakTemp_aCostume := self costume.
	_gsSqueakTemp_aCostume isWorldMorph
		ifTrue: [^ self].
	_gsSqueakTemp_aCostume owner == _gsSqueakTemp_hisCostume owner
		ifFalse: [_gsSqueakTemp_hisCostume owner addMorphFront: _gsSqueakTemp_aCostume].
	_gsSqueakTemp_aCostume position: _gsSqueakTemp_hisCostume bounds rightCenter - (0 @ (_gsSqueakTemp_aCostume height // 2))