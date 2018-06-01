toolbuilder
buildWith: builder
	"ToolBuilder open: MessageNames new"

	| windowSpec max searchHeight |
	max := self wantsOptionalButtons ifTrue:[0.42] ifFalse:[0.5].
	searchHeight := Preferences standardDefaultTextFont height * 2.
	
	windowSpec := self buildWindowWith: builder specs: {
		(0@0 corner: 0.5@0.1) -> [self buildSearchPaneWith: builder].
		(0@0.1 corner: 0.5 @ max) -> [self buildSelectorListWith: builder].
		(0.5@0.0 corner: 1.0@max) -> [self buildMessageListWith: builder].
		(0@max corner: 1@1) -> [self buildCodePaneWith: builder].
	}.

	^ builder build: windowSpec