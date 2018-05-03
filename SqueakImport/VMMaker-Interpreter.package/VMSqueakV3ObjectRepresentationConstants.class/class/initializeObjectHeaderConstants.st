class initialization
initializeObjectHeaderConstants

	"masks for type field"
	TypeMask := 3.

	"type field values"
	HeaderTypeSizeAndClass := 0.
	"HeaderTypeClass := 1." "defined in ObjectMemory"
	"HeaderTypeFree := 2."
	HeaderTypeShort := 3.

	"Base header word bit fields"
	HashBitsOffset := 17.
	HashMaskUnshifted := 16rFFF.
	CompactClassMask := 16r1F000.
