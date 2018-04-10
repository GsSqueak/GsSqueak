utilities
indexForInserting: aMorph at: aPoint in: owner 
	"Return the insertion index based on the layout strategy defined for
	some morph. Used for drop insertion."
	| _gsSqueakTemp_horizontal _gsSqueakTemp_morphList _gsSqueakTemp_index |
	owner hasSubmorphs
		ifFalse: [^ 1].
	aMorph disableTableLayout
		ifTrue: [^ 1].
	_gsSqueakTemp_horizontal := (owner listDirection == #topToBottom
				or: [owner listDirection == #bottomToTop]) not.
	_gsSqueakTemp_morphList := owner submorphs.
	owner reverseTableCells
		ifTrue: [_gsSqueakTemp_morphList := _gsSqueakTemp_morphList reversed].
	_gsSqueakTemp_index := self
				indexForInserting: aPoint
				inList: _gsSqueakTemp_morphList
				horizontal: _gsSqueakTemp_horizontal
				target: owner.
	owner reverseTableCells
		ifTrue: [_gsSqueakTemp_index := _gsSqueakTemp_morphList size - _gsSqueakTemp_index + 2].
	^ _gsSqueakTemp_index
		ifNil: [1]