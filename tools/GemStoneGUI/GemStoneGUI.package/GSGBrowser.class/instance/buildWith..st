toolbuilder
buildWith: builder

	| max windowSpec |
	max := self wantsOptionalButtons ifTrue:[0.42] ifFalse:[0.5].
	windowSpec := self buildWindowWith: builder specs: {
		(0@0 corner: 0.25@max) -> [self buildSystemCategoryListWith: builder].
		(self classListFrame: max) -> [self buildClassListWith: builder].
		(self classContentSwitchesFrame: max) -> [self buildClassContentSwitchesWith: builder].
		(self messageCategoryListFrame: max) -> [self buildMessageCategoryListWith: builder].
		(self metaclassSwitchesFrame: max) -> [self buildMetaclassSwitchesWith: builder].
		(0.75@0 corner: 1@max) -> [self buildMessageListWith: builder].
		(0@max corner: 1@1) -> [self buildCodePaneWith: builder]}.
	^ builder build: windowSpec