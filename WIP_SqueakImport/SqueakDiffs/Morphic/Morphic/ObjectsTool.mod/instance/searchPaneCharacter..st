search
searchPaneCharacter: evt
	"A character represented by the event handed in was typed in the search pane by the user"

	^ self showMorphsMatchingSearchString

"	| char |  *** The variant below only does a new search if RETURN or ENTER is hit ***
	char := evt keyCharacter.
	(char == Character enter or: [char == Character cr]) ifTrue:
		[self showMorphsMatchingSearchString]"