translation
shouldIncludeMethodForSelector: selector 
	"Answer whether a primitive method should be translated. Emit a
	warning to the transcript if the method doesn't exist."
	^ (self whichClassIncludesSelector: selector)
		ifNil: [Transcript nextPutAll: 'Cannot find implementation of ';
				 nextPutAll: selector;
				 nextPutAll: ' in hierarchy of ';
				 print: self;
				 cr;
				 flush.
			false]
		ifNotNil: [:c | (c >> selector pragmaAt: #option:)
				ifNil: [true]
				ifNotNil: [:pragma | (VMBasicConstants defineAtCompileTime: pragma arguments first)
						or: [initializationOptions
								at: pragma arguments first
								ifAbsent: [(self bindingOf: pragma arguments first)
										ifNil: [false]
										ifNotNil: [:binding | binding value ~~ #undefined]]]]]