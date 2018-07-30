toolbuilder
windowElements: builder

	^ {self buildDevKitPathInputWith: builder} ,
		(super windowElements: builder)