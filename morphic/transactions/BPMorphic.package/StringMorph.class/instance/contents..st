accessing
contents: newContents 
	| _gsSqueakTemp_scanner |
	contents := newContents isText
				ifTrue: [_gsSqueakTemp_scanner := StringMorphAttributeScanner new initializeFromStringMorph: self.
					(newContents attributesAt: 1 forStyle: self font textStyle)
						do: [:attr | attr emphasizeScanner: _gsSqueakTemp_scanner].
					emphasis := _gsSqueakTemp_scanner emphasis.
					font := _gsSqueakTemp_scanner font.
					color := _gsSqueakTemp_scanner textColor.
					newContents string]
				ifFalse: [contents = newContents
						ifTrue: [^ self].
					"no substantive change"
					newContents].
	self fitContents