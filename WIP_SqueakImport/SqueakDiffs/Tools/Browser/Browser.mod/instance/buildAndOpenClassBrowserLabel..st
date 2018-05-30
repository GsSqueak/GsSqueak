toolbuilder
buildAndOpenClassBrowserLabel: aLabelString
	"assemble the spec for a class browser, build it and open it"

	| builder max windowSpec catPaneHeight|
	builder := ToolBuilder default.
	catPaneHeight := Preferences standardListFont height + 5 "top margin/border" + 5 "bottom margin/border".
	max := self wantsOptionalButtons ifTrue:[0.32] ifFalse:[0.4].

	windowSpec :=self buildWindowWith: builder specs: {
		(self topConstantHeightFrame: self buttonHeight fromLeft: 0 width: 0.5) -> [self buildClassListSingletonWith: builder].
		(self frameOffsetFromTop: self buttonHeight fromLeft: 0 width: 0.5 bottomFraction: max) -> [self buildMessageCategoryListWith: builder].
		(self topConstantHeightFrame: self buttonHeight fromLeft: 0.5 width: 0.5) -> [self buildSwitchesWith: builder].
		(self frameOffsetFromTop: self buttonHeight fromLeft: 0.5 width: 0.5 bottomFraction: max) -> [self buildMessageListWith: builder].
		(0@max corner: 1@1) -> [self buildCodePaneWith: builder].
	}.
	self setMultiWindowFor:windowSpec.
	windowSpec label: aLabelString.

	builder open: windowSpec.
	
	^self
