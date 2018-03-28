toolbuilder
buildWith: builder

	| windowSpec |
	
	windowSpec := self buildWindowWith: builder specs: {
		(0@0 corner: 0.5@0.4) -> [self buildBrowserButtonWith: builder].
		(0@0.4 corner: 0.5@0.8) -> [self buildWorkspaceButtonWith: builder].
		
		(0.5@0 corner: 1@0.3) -> [self buildCommitButtonWith: builder].
		(0.5@0.3 corner: 1@0.5) -> [self buildContinueButtonWith: builder].
		(0.5@0.5 corner: 1@0.8) -> [self buildAbortButtonWith: builder].
		
		(0@0.8 corner: 1@1) -> [self buildLogoutButtonWith: builder]
	}.
	
	^ builder build: windowSpec