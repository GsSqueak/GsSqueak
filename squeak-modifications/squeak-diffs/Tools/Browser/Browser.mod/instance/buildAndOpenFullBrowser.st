toolbuilder
buildAndOpenFullBrowser
	"assemble the spec for a full system browser, build it and open it"

	| builder  windowSpec |
	builder := ToolBuilder default.

	"the build-but-don't-open phase is factored out to support the prototypicalToolWindow facility"
	windowSpec := self buildDefaultBrowserWith: builder.
	builder open: windowSpec.
	
	^self
