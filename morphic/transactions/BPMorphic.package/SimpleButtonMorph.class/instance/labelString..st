accessing
labelString: aString 
	(self findA: StringMorph)
		ifNil: [self label: aString]
		ifNotNil: [:_gsSqueakTemp_existingLabel | 
			_gsSqueakTemp_existingLabel contents: aString.
			self fitContents]