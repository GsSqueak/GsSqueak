instance creation
methodBrowserSearchingFor: searchString
	"Answer an method-browser window whose search-string is initially as indicated"

	| aWindow |
	aWindow := self new searchString: searchString.
	^ToolBuilder default build: aWindow