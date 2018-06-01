toolbuilder
buildWith: builder
	"Create the ui for the browser"
	| windowSpec max |
	max := self wantsOptionalButtons ifTrue:[0.42] ifFalse:[0.5].
	windowSpec := self buildWindowWith: builder specs: {
		(0@0 corner: 0.2@max) -> [self buildPackageListWith: builder].
		(0.2@0 corner: 0.4@max) -> [self buildPackageDepsWith: builder].
		(0.4@0 corner: 0.6@max) -> [self buildClassDepsWith: builder].
		(0.6@0 corner: 0.8@max) -> [self buildClassListWith: builder].
		(0.8@0 corner: 1.0@max) -> [self buildMessageListWith: builder].
		(0@max corner: 1@1) -> [self buildCodePaneWith: builder].
	}.
	^builder build: windowSpec