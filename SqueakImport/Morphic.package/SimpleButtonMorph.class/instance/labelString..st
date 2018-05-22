accessing
labelString: aString

	| existingLabel |
	(existingLabel := self findA: StringMorph)
		ifNil:
			[self label: aString]
		ifNotNil:
			[existingLabel contents: aString.
			self fitContents]
