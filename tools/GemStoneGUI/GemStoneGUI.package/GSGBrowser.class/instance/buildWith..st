toolbuilder
buildWith: builder

	| max windowSpec |
	max := self wantsOptionalButtons ifTrue:[0.42] ifFalse:[0.5].

	windowSpec := self buildWindowWith: builder specs: {
		(self systemCategoryListFrame: max) 
			-> [self buildSystemCategoryListWith: builder].
		(self classListFrame: max) 
			-> [self buildClassListWith: builder].
		(self metaclassSwitchesFrame: max) 
			-> [self buildMetaclassSwitchesWith: builder].
		(self environmentIdListFrame: max) 
			-> [self buildEnvironmentIdListWith: builder].
		(self messageCategoryListFrame: max)
			-> [self buildMessageCategoryListWith: builder].
		(self classContentSwitchesFrame: max) 
			-> [self buildClassContentSwitchesWith: builder].
		(self messageListFrame: max) 
			-> [self buildMessageListWith: builder].
		(0@max corner: 1@1) 
			-> [self buildCodePaneWith: builder].
	}.

	^ builder build: windowSpec