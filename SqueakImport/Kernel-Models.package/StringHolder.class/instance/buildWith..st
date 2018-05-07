toolbuilder
buildWith: builder
	| windowSpec |
	windowSpec := 	self buildWindowWith: builder specs: {
		(0@0corner: 1@1) -> [self buildCodePaneWith: builder].
	}.
	^builder build: windowSpec