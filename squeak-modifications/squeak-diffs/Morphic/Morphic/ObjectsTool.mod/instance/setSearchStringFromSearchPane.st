search
setSearchStringFromSearchPane
	"Set the search string by obtaining its contents from the search pane, and doing a certain amount of munging"

	searchString := self searchPane text string asLowercase withBlanksTrimmed.
	searchString := searchString copyWithoutAll: {Character enter. Character cr}