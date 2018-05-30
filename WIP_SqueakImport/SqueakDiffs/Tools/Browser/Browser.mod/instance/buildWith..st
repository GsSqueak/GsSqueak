toolbuilder
buildWith: builder
	"Create the ui for the browser"
	"Browser is a bit of an oddity in the ToolBuilder>build: world since the class provides several dfferent UIs rather than the one-per-class idiom of ToolBuilder. Here we are building the full browser version"

	^self buildDefaultBrowserWith: builder 