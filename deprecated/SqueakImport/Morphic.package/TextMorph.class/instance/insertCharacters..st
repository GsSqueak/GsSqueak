scripting access
insertCharacters: aString
	"Insert the characters from the given source at my current cursor position"

	| aLoc aText attributes |
	aLoc := self cursor max: 1.
	aText := aLoc > text size
		ifTrue: [aString asText]
		ifFalse: [
			attributes := (text attributesAt: aLoc)
				select: [:attr | attr mayBeExtended].
			Text string: aString attributes: attributes].
	paragraph replaceFrom: aLoc to: (aLoc - 1) with: aText displaying: true.
	self updateFromParagraph  