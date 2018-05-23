insert and delete
insertPageLabel: labelString morphs: morphList 
	| _gsSqueakTemp_m _gsSqueakTemp_c _gsSqueakTemp_labelAllowance |
	self insertPage.
	labelString
		ifNil: [_gsSqueakTemp_labelAllowance := 0]
		ifNotNil: [_gsSqueakTemp_m := TextMorph new extent: currentPage width @ 20;
						 contents: labelString.
			_gsSqueakTemp_m lock.
			_gsSqueakTemp_m position: currentPage position + (currentPage width - _gsSqueakTemp_m width // 2 @ 5).
			currentPage addMorph: _gsSqueakTemp_m.
			_gsSqueakTemp_labelAllowance := 40].
	"use a column to align the given morphs, then add them to the page"
	_gsSqueakTemp_c := AlignmentMorph newColumn wrapCentering: #center;
				 cellPositioning: #topCenter.
	_gsSqueakTemp_c addAllMorphs: morphList.
	_gsSqueakTemp_c position: currentPage position + (0 @ _gsSqueakTemp_labelAllowance).
	currentPage addAllMorphs: morphList.
	^ currentPage