private
glyphInfoOf: aCharacter into: glyphInfoArray
"since we replace every character with substitutionCharacter, get my baseFont's glyphInfo for that"
	^ baseFont glyphInfoOf: substitutionCharacter into: glyphInfoArray.
