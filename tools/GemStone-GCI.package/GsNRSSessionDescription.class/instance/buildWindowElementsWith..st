toolbuilder
buildWindowElementsWith: builder

	| inputFields |
	inputFields := {
		self buildStoneNRSInputWith: builder.
		self buildVersionInputWith: builder.
		self buildGemNRSInputWith: builder.
		self buildUserIDInputWith: builder.
		self buildPasswordInputWith: builder}.
	^ self layoutEvenly: inputFields within: (0@0 corner: 1@1) horizontal: false