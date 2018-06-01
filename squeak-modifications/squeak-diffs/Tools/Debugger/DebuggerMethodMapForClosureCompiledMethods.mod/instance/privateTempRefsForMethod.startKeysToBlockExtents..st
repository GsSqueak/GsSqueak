private
privateTempRefsForMethod: method startKeysToBlockExtents: startKeysToBlockExtents
	"Answer the sequence of temps in scope in method in the natural order,
	 outermost arguments and temporaries first, innermost last.  Each temp is
	 a pair of the temp's name followed by a reference.  The reference can be
		integer - index of temp in aContext
		#( indirectionVectorIndex tempIndex ) - remote temp in indirectionVector at index in aContext
		#( outer. temp reference ) - a temp reference in an outer context."
	blockExtentsToTempRefs ifNil:
		[blockExtentsToTempRefs := (method holdsTempNames
										ifTrue: [method]
										ifFalse: [methodNode]) blockExtentsToTempsMap.
		 blockExtentsToTempRefs ifNil:
			["an empty method.  shouldn't be able to step into here but it
			  can happen in weird circumstances (i.e. with MethodWrapper)."
			blockExtentsToTempRefs := Dictionary new.
			blockExtentsToTempRefs
				at: (startKeysToBlockExtents at: method startKey)
				put: {}].
		 startKeysToTempRefs := Dictionary new].
	^startKeysToTempRefs
		at: method startKey
		ifAbsentPut:
			[blockExtentsToTempRefs at: (startKeysToBlockExtents at: method startKey)]