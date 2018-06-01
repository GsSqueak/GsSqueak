gc -- compaction
mapRootObjects
	"Remap pointers for root objects that may contains pointers to a remapped memory range"
	nilObj := self remap: nilObj.
	falseObj := self remap: falseObj.
	trueObj := self remap: trueObj.
	specialObjectsOop := self remap: specialObjectsOop.
