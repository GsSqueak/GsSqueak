cache access
purge: megs
	"Replace morphs with tombstones in all pages that are clean and not being shown.  Do this until megs of new memory have been recovered.  Write any dirty ones first, if allowed to."

	| goal |
	goal := Smalltalk garbageCollect + (megs * 1000000) asInteger.
	PageCache doPagesInMemory: [:aPage | 
		GlobalPolicy == #neverWrite ifFalse: [aPage write].
		aPage purge.
		Smalltalk garbageCollect > goal ifTrue: [^ true]].	"got enough"
	^ false	"caller may want to tell the user to write out more pages"