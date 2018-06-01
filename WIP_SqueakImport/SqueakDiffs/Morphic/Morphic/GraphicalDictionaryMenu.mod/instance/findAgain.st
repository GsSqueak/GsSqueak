menu commands
findAgain
	"Look for the next occurrence of the search string"

	| toFind searchIndex |
	lastSearchString ifNil: [lastSearchString := 'controls'].
	searchIndex := currentIndex + 1.
	searchIndex > entryNames size ifTrue:
		[currentIndex := 0.
		self inform: 'not found' translated.
		^ self].
	toFind := '*', lastSearchString, '*'.
	[toFind match: (entryNames at: searchIndex) asString]
		whileFalse:
			[searchIndex := (searchIndex \\ entryNames size) + 1.
			searchIndex == currentIndex ifTrue:
				[^ (toFind match: (entryNames at: searchIndex) asString)
					ifFalse:
						[self inform: 'not found' translated]
					ifTrue:
						[self flash]]].

	currentIndex := searchIndex.
	self updateThumbnail