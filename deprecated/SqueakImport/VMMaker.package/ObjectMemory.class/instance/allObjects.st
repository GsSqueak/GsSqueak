primitive support
allObjects
	"Attempt to answer an array of all objects, excluding those that may
	be garbage collected as a side effect of allocating the result array.
	If no memory is available answer 0."
	| count obj resultArray newCount |
	"Count the currently accessible objects"
	count := 0.
	obj := self firstAccessibleObject.
	[obj = nil] whileFalse:
		[count := count + 1.
		obj := self accessibleObjectAfter: obj].
	"Allocate result array, may cause GC"
	resultArray := self instantiateClass: self classArray indexableSize: count.
	resultArray = nil ifTrue:
		[^0].
	"Store all objects in result array, excluding any reference to the result array itself,
	 as may happen if garbage collection occurred during allocation of the array. No store
	 check is necessary; the result array will be the last object in memory and hence new."
	newCount := 0.
	obj := self firstAccessibleObject.
	[obj = nil or: [newCount >= count]] whileFalse:
		[obj == resultArray
			ifFalse: [newCount := newCount + 1.
				self stObject: resultArray at: newCount put: obj ].
		obj := self accessibleObjectAfter: obj].
	"If GC occurred during result array allocation, truncate unused portion of result array"
	newCount < count ifTrue:
		[self shorten: resultArray toIndexableSize: newCount].
	^resultArray