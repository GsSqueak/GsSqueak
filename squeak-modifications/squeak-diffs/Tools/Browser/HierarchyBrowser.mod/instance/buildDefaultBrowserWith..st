toolbuilder
buildDefaultBrowserWith: builder
	"assemble the spec for a hierarchical browser, build it and return the built but not opened morph"
	"this build-but-don't-open phase is factored out to support the prototypicalToolWindow facility"

	| max windowSpec |


	self setupIfNotInitialisedYet. 
	max := self wantsOptionalButtons ifTrue:[0.32] ifFalse:[0.4].

	windowSpec := self buildWindowWith: builder specs: {
		(self classListFrame: max fromTop: 0 fromLeft: 0 width: 0.333) -> [self buildClassListWith: builder].
		(self switchesFrame: max fromLeft: 0 width: 0.333) -> [self buildSwitchesWith: builder].
		(LayoutFrame fractions: (0.333@0 corner: 0.666@max) offsets: (0@0 corner: 0@0)) -> [self buildMessageCategoryListWith: builder].
		(LayoutFrame fractions: (0.666@0 corner: 1@max) offsets: (0@0 corner: 0@0)) -> [self buildMessageListWith: builder].
		(0@max corner: 1@1) -> [self buildCodePaneWith: builder].
	}.
	self setMultiWindowFor:windowSpec.

	^builder build: windowSpec