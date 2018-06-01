toolbuilder
buildCategoryBrowserWith: builder
	"assemble the spec for a system category browser, build it and return it"

	| max windowSpec catPaneHeight|
	catPaneHeight := Preferences standardListFont height + 5 "top margin/border" + 5 "bottom margin/border".
	max := self wantsOptionalButtons ifTrue:[0.32] ifFalse:[0.4].

	windowSpec := self buildWindowWith: builder specs: {
		(LayoutFrame fractions: (0@0 corner: 1.0@0) offsets: (0@0 corner: 0@catPaneHeight)) -> [self buildSystemCatListSingletonWith: builder].
		((self classListFrame: max fromTop: 0 fromLeft: 0 width: 0.333)
			topOffset: catPaneHeight) -> [self buildClassListWith: builder].
		(self switchesFrame: max fromLeft: 0 width: 0.333) -> [self buildSwitchesWith: builder].
		(LayoutFrame fractions: (0.333@0 corner: 0.666@max) offsets: (0@catPaneHeight corner: 0@0)) -> [self buildMessageCategoryListWith: builder].
		(LayoutFrame fractions: (0.666@0 corner: 1@max) offsets: (0@catPaneHeight corner: 0@0)) -> [self buildMessageListWith: builder].
		(0@max corner: 1@1) -> [self buildCodePaneWith: builder].
	}.
	self setMultiWindowFor:windowSpec.

	^builder build: windowSpec
