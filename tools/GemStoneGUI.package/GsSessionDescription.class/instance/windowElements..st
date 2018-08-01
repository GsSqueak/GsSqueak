toolbuilder
windowElements: builder

	^ {self buildVersionInputWith: builder.
		self buildUserIDInputWith: builder.
		self buildPasswordInputWith: builder}