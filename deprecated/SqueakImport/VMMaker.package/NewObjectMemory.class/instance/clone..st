allocation
clone: oop
	"Return a shallow copy of the given object. May cause GC"
	"Assume: Oop is a real object, not a small integer.
	 Override to assert it's not a married context"
	| extraHdrBytes bytes newChunk remappedOop fromIndex toIndex lastFrom newOop header hash |
	<inline: false>
	<var: #lastFrom type: 'usqInt'>
	<var: #fromIndex type: 'usqInt'>
	self assert: ((coInterpreter isContext: oop) not
				or: [(coInterpreter isMarriedOrWidowedContext: oop) not]). 

	extraHdrBytes := self extraHeaderBytes: oop.
	bytes := self sizeBitsOf: oop.
	bytes := bytes + extraHdrBytes.

	"allocate space for the copy, remapping oop in case of a GC"
	self pushRemappableOop: oop.
	"check it is safe to allocate this much memory. Return 0 if not"
	(self sufficientSpaceToAllocate: 2500 + bytes) ifFalse:[^0].
	newChunk := self allocateChunk: bytes.
	remappedOop := self popRemappableOop.

	"copy old to new including all header words"
	toIndex := newChunk - self bytesPerWord.  "loop below uses pre-increment"
	fromIndex := (remappedOop - extraHdrBytes) - self bytesPerWord.
	lastFrom := fromIndex + bytes.
	[fromIndex < lastFrom] whileTrue: [
		self longAt: (toIndex := toIndex + self bytesPerWord) put: (self longAt: (fromIndex := fromIndex + self bytesPerWord))].
	newOop := newChunk + extraHdrBytes.  "convert from chunk to oop"

	"fix base header: compute new hash and clear Mark and Root bits"
	hash := self newObjectHash.
	header := (self longAt: newOop) bitAnd: 16r1FFFF.
	"use old ccIndex, format, size, and header-type fields"
	header := header bitOr: ((hash << 17) bitAnd: 16r1FFE0000).
	self longAt: newOop put: header.
	^newOop
