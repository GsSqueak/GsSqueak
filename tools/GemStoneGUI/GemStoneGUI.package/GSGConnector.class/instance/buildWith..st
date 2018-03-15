toolbuilder
buildWith: builder

	| windowSpec |
	
	windowSpec := self buildWindowWith: builder specs: {
		(0@0 corner: 1@0.2) -> [self buildDevkitPathInputWith: builder].
		(0@0.2 corner: 1@0.4) -> [self buildStoneNameInputWith: builder].
		(0@0.4 corner: 1@0.6) -> [self buildUsernameInputWith: builder].
		(0@0.6 corner: 1@0.8) -> [self buildPasswordInputWith: builder].
		(0@0.8 corner: 1@1) -> [self buildLoginButtonWith: builder]
	}.
	
	^ builder build: windowSpec