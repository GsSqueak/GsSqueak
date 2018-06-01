toolbuilder
buildAndOpenCategoryBrowserLabel: aLabelString
	"assemble the spec for a system category browser, build it and open it"

	| builder windowSpec |
	builder := ToolBuilder default.

	windowSpec := self buildCategoryBrowserWith: builder.
	aLabelString ifNotNil:[:str| windowSpec label: str].

	builder open: windowSpec.
	
	^self
