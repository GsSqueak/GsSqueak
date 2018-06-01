toolbuilder
buildAndOpenMessageCategoryBrowserLabel: aLabelString
	"assemble the spec for a messasge category browser, build it and open it"

	| builder max windowSpec|
	builder := ToolBuilder default.
	max := self wantsOptionalButtons ifTrue:[0.32] ifFalse:[0.4].

	windowSpec :=self buildWindowWith: builder specs: {
		(0@0 corner: 1.0@0.08) -> [self buildMessageListCatSingletonWith: builder].
		(0.0@0.08 corner: 1.0@max) -> [self buildMessageListWith: builder].
		(0@max corner: 1@1) -> [self buildCodePaneWith: builder].
	}.
	self setMultiWindowFor:windowSpec.
	windowSpec label: aLabelString.

	builder open: windowSpec.
	
	^self
