initialization
initializeObjectHeaderConstants

	"masks for type field"
	TypeMask := 3.

	"type field values"
	HeaderTypeSizeAndClass := 0.
	HeaderTypeClass := 1.
	HeaderTypeFree := 2.
	HeaderTypeShort := 3.

	"type field values used during the mark phase of GC"
	HeaderTypeGC := 2.
	GCTopMarker := 3.  "neither an oop, nor an oop+1, this value signals that we have crawled back up to the top of the marking phase."

	"Base header word bit fields"
	HashBits := 16r1FFE0000.
	HashBitsOffset := 17.

	CompactClassMask := 16r1F000
