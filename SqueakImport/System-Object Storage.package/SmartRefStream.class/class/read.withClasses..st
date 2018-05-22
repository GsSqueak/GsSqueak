i/o
read: aByteStream withClasses: structureArray
	"Read an object off the stream, but first check structureArray against the current system."

	| me |
	me := self on: aByteStream.
	me noHeader.
	me structures: (structureArray at: 2).
	me superclasses: (structureArray at: 4).
	(me verifyStructure = 'conversion method needed') ifTrue: [^ nil].
	^ super next
