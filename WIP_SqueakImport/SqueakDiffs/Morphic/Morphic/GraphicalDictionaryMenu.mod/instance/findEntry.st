menu commands
findEntry
	"Prompt the user for a search string and find the next match for it"

	| toFind searchIndex |
	lastSearchString ifNil: [lastSearchString := 'controls'].
	toFind := UIManager default request: 'Type name or fragment: ' initialAnswer: lastSearchString.
	toFind isEmptyOrNil ifTrue: [^ self].
	lastSearchString := toFind asLowercase.
	searchIndex := currentIndex + 1.
	toFind := '*', lastSearchString, '*'.
	[toFind match: (entryNames at: searchIndex) asString]
		whileFalse:
			[searchIndex := (searchIndex \\ entryNames size) + 1.
			searchIndex == currentIndex ifTrue: [^ self inform: 'not found']].

	currentIndex := searchIndex.
	self updateThumbnail