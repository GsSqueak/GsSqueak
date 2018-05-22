accessing
contents: newContents 
	| scanner |
	contents := newContents isText
				ifTrue: [scanner := StringMorphAttributeScanner new initializeFromStringMorph: self.
					(newContents attributesAt: 1 forStyle: self font textStyle)
						do: [:attr | attr emphasizeScanner: scanner].
					emphasis := scanner emphasis.
					font := scanner font.
					color := scanner textColor.
					newContents string]
				ifFalse: [contents = newContents
						ifTrue: [^ self].
					"no substantive change"
					newContents].
	self fitContents