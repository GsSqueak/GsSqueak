as yet unclassified
generateTrailerKindDecoders

	self class
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: 'trailerKindDecoders'; cr;
				cr;
				tab; nextPut: $^; print: (
					self trailerKinds collect: [ :each | 
						('decode', each) asSymbol ]) ])
		classified: 'generated'
		