private
privateDereference: tempReference in: aContext put: aValue
	"Assign the temporary with reference tempReference in aContext.
	 tempReference can be
		integer - direct temp reference
		#( indirectionVectorIndex tempIndex ) - remote temp in indirectionVector at index
		#( outer. temp reference ) - a temp reference in an outer context."
	^tempReference isInteger
		ifTrue:
			[tempReference <= aContext stackPtr
				ifTrue:
					[aContext tempAt: tempReference put: aValue]
				ifFalse:
					[UIManager default inform: 'Cannot assign temp because it is no longer on stack.\Activation has returned?' withCRs.
							nil]]
		ifFalse:
			[tempReference first == #outer
				ifTrue:
					[self privateDereference: tempReference last
						in: aContext outerContext
						put: aValue]
				ifFalse: "If stopped before indirection vectors are created they will be nil."
					[tempReference first <= aContext stackPtr
						ifTrue:
							[(aContext tempAt: tempReference first)
								ifNil: [UIManager default inform: 'Cannot assign remote temp because indirection vector is nil.\Too early in method execution?' withCRs.
									nil]
								ifNotNil:
									[:indirectionVector|
									indirectionVector
										at: tempReference second
										put: aValue]]
						ifFalse:
							[UIManager default inform: 'Cannot assign remote temp because it is no longer on stack.\Activation has returned?' withCRs.
							nil]]]