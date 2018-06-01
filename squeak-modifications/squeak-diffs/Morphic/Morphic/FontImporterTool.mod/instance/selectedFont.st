font list
selectedFont
	| fontDesc font |
	fontDesc := self currentSelection.
	font := self fontFromFamily: fontDesc.
	font isFontSet ifTrue: [
		font := (self currentParent isNil or: [self currentParent = self currentSelection])
			ifTrue: [font fontArray anyOne]
			ifFalse: [ "we have selected a leaf  "
				font fontArray
					detect: [:subfont | subfont subfamilyName = fontDesc fontname]
					ifNone: [font]]].
	^font emphasized: emphasis