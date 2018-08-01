toolbuilder
windowElements: builder

	^ {self buildStoneNRSInputWith: builder.
		self buildGemNRSInputWith: builder} ,
		(super windowElements: builder)