initialization
initializeMethodIndices
	"Class CompiledMethod"
	| _gsSqueakTemp_tagBits |
	HeaderIndex := 0.
	LiteralStart := 1.
	_gsSqueakTemp_tagBits := self objectMemoryClass numSmallIntegerTagBits.
	LargeContextBit := 131072 << _gsSqueakTemp_tagBits.
	"This bit set in method headers if large context is needed."
	MethodHeaderTempCountShift := 18 + _gsSqueakTemp_tagBits.
	MethodHeaderArgCountShift := 24 + _gsSqueakTemp_tagBits.
	V3PrimitiveBitsMask := 268435967 << _gsSqueakTemp_tagBits.
	AlternateHeaderHasPrimFlag := 65536 << _gsSqueakTemp_tagBits.
	AlternateHeaderIsOptimizedFlag := 32768 << _gsSqueakTemp_tagBits.
	AlternateHeaderNumLiteralsMask := 32767.
	"N.B. *not* shifted"
	"The position of the unused flag bit in the method header, not
	including tag bit(s).
	Bits 28 & 29 are either used as an accessModifer code in Newspeak
	(public, private, protected)
	or are free for use as flag bits."
	MethodHeaderFlagBitPosition := 28 + _gsSqueakTemp_tagBits.
	AccessModifierPublic := 0.
	AccessModifierPrivate := 1.
	AccessModifierProtected := 2