accessing
subObjects: anObject ofClass: aClass
	"Return a collection of all instances of aClass that would be written out with anObject.  Does not actually write on the disk.  Inspect the result and ask for 'references to this object'."

	| dummy coll |
	dummy := ReferenceStream on: (DummyStream on: nil).
		"Write to a fake Stream, not a file"
	"Collect all objects"
	dummy rootObject: anObject.	"inform him about the root"
	dummy nextPut: anObject.
	coll := OrderedCollection new.
	dummy references keysDo: [:each |
		each class == aClass ifTrue: [coll add: each]].
	^ coll