toolbuilder
buildWith: builder

	| max windowSpec |
	max := self wantsOptionalButtons ifTrue:[0.42] ifFalse:[0.5].

	windowSpec := self buildWindowWith: builder specs: {
		(0@0 corner: 0.25@max) -> [self buildSystemCategoryListWith: builder].
		(self classListFrame: max) -> [self buildClassListWith: builder].
		(self switchesFrame: max) -> [self buildSwitchesWith: builder].
		(self environmentIdListFrame: max) -> [self buildEnvironmentIdListWith: builder].
		(self messageCategoryListFrame: max) -> [self buildMessageCategoryListWith: builder].
		(self messageListFrame: max) -> [self buildMessageListWith: builder].
		(0@max corner: 1@1) -> [self buildCodePaneWith: builder].
	}.

	^ builder build: windowSpec