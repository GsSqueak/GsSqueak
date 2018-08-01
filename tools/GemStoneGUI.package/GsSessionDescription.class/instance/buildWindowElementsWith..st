toolbuilder
buildWindowElementsWith: builder

	^ self 
		layoutEvenly: (self windowElements: builder)
		within: (0@0 corner: 1@1)
		horizontal: false