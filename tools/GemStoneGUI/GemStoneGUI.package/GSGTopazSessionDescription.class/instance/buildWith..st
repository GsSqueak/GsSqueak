toolbuilder
buildWith: builder

	| windowSpec |	
	windowSpec := self buildWindowWith: builder specs: {
		(0@0 corner: 1@0.25) -> [self buildDevkitPathInputWith: builder].
		(0@0.25 corner: 1@0.5) -> [self buildStoneNameInputWith: builder].
		(0@0.5 corner: 1@0.75) -> [self buildUsernameInputWith: builder].
		(0@0.75 corner: 1@1) -> [self buildPasswordInputWith: builder]
	}.
	windowSpec buttons: (self buildButtonsWith: builder).	
	^ builder build: windowSpec