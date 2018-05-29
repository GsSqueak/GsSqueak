toolbuilder
buildAndOpenBrowserLabel: aLabelString
	"assemble the spec for a class list/hierarchy browser, build it and open it"

	| builder  windowSpec |
	builder := ToolBuilder default.

	windowSpec := self buildDefaultBrowserWith: builder.
	aLabelString ifNotNil:[:str| windowSpec label: str].

	builder open: windowSpec.
	
	^self
