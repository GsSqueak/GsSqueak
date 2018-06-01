private
privateDereference: tempReference in: aContext
	"Fetch the temporary with reference tempReference in aContext.
	 tempReference can be
		integer - direct temp reference
		#( indirectionVectorIndex tempIndex ) - remote temp in indirectionVector at index
		#( outer. temp reference ) - a temp reference in an outer context."
	^tempReference isInteger
		ifTrue:
			[tempReference <= aContext stackPtr ifTrue:
				[aContext tempAt: tempReference]]
		ifFalse:
			[tempReference first == #outer
				ifTrue:
					[self privateDereference: tempReference last
						in: aContext outerContext]
				ifFalse: "If stopped before indirection vectors are created they will be nil. Simply answer nil"
					[tempReference first <= aContext stackPtr ifTrue:
						[(aContext tempAt: tempReference first) ifNotNil:
							[:indirectionVector|
							indirectionVector at: tempReference second]]]]