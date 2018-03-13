toolbuilder
buildDefaultBrowserWith: builder

	| max windowSpec |
	max := self wantsOptionalButtons ifTrue:[0.42] ifFalse:[0.5].
	
	windowSpec := self buildWindowWith: builder specs: {
		(0@0 corner: 0.25@max) -> [self buildSystemCategoryListWith: builder].
		(self classListFrame: max) -> [self buildClassListWith: builder].
		(self switchesFrame: max) -> [self buildSwitchesWith: builder].
		(0.5@0 corner: 0.75@max) -> [self buildMessageCategoryListWith: builder].
		(0.75@0 corner: 1@max) -> [self buildMessageListWith: builder].
		(0@max corner: 1@1) -> [self buildCodePaneWith: builder]
	}.
	self setMultiWindowFor:windowSpec.
	
	^ builder build: windowSpec