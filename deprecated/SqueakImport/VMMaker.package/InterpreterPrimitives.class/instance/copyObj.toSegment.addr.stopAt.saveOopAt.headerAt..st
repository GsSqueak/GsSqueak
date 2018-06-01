image segment in/out
copyObj: oop toSegment: segmentWordArray addr: lastSeg stopAt: stopAddr saveOopAt: oopPtr headerAt: hdrPtr
	"Copy this object into the segment beginning at lastSeg.
	Install a forwarding pointer, and save oop and header.
	Fail if out of space.  Return the next segmentAddr if successful."

	"Copy the object..."
	| extraSize bodySize hdrAddr |
	self flag: #Dan.  "None of the imageSegment stuff has been updated for 64 bits"
	self successful ifFalse: [^ lastSeg].
	extraSize := objectMemory extraHeaderBytes: oop.
	bodySize := objectMemory sizeBitsOf: oop.
	(objectMemory oop: (lastSeg + extraSize + bodySize) isGreaterThanOrEqualTo: stopAddr)
		ifTrue: [^ self primitiveFail].
	self transfer: extraSize + bodySize // objectMemory bytesPerWord  "wordCount"
		from: oop - extraSize
		to: lastSeg + objectMemory bytesPerWord.

	"Clear root and mark bits of all headers copied into the segment"
	hdrAddr := lastSeg + objectMemory bytesPerWord + extraSize.
	objectMemory longAt: hdrAddr put: ((objectMemory longAt: hdrAddr) bitAnd: objectMemory allButRootBit - objectMemory markBit).

	objectMemory forward: oop to: (lastSeg + objectMemory bytesPerWord + extraSize - segmentWordArray)
		savingOopAt: oopPtr andHeaderAt: hdrPtr.

	"Return new end of segment"
	^ lastSeg + extraSize + bodySize