editing
enterClickableRegion: evt 
	| _gsSqueakTemp_index _gsSqueakTemp_isLink |
	evt hand hasSubmorphs
		ifTrue: [^ self].
	evt hand temporaryCursor
		ifNotNil: [^ self].
	paragraph
		ifNotNil: [_gsSqueakTemp_index := (paragraph characterBlockAtPoint: evt position) stringIndex.
			_gsSqueakTemp_isLink := (paragraph text attributesAt: _gsSqueakTemp_index forStyle: paragraph textStyle)
						anySatisfy: [:attr | attr mayActOnClick].
			_gsSqueakTemp_isLink
				ifTrue: [Cursor webLink show]
				ifFalse: [Cursor normal show]]