utilities
tallyOfSubObjects: anObject
	"Open a window with statistics on what objects would be written out with anObject.  Does not actually write on the disk.  Stats are simply the number of instances of each class:
	1450->Point   835->Rectangle   549->Array   300->String"

	| dummy bag |
	dummy := ReferenceStream on: (DummyStream on: nil).
		"Write to a fake Stream, not a file"
	"Collect all objects"
	dummy rootObject: anObject.	"inform him about the root"
	dummy nextPut: anObject.
	bag := Bag new.
	dummy references keysDo: [:key | bag add: key class name].
	"(bag sortedCounts) is the SortedCollection"
	(StringHolder new contents: bag sortedCounts printString) 
		openLabel: 'ReferenceStream statistics'.