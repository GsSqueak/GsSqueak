comparing
hash
	"CompiledMethod>>#= compares code, i.e. same literals and same
	bytecode. So we look at the header, methodClass and some bytes
	between initialPC and endPC,
	but /not/ the selector because the equal method does not compare
	selectors. Note that we must override ByteArray>hash which looks at
	all bytes of the receiver.
	Using bytes from the pointer part of a COmpiledmethod can lead to a
	variable hash
	if and when when the GC moves literals in the receiver."
	| _gsSqueakTemp_initialPC _gsSqueakTemp_endPC _gsSqueakTemp_hash |
	_gsSqueakTemp_initialPC := self initialPC.
	_gsSqueakTemp_endPC := self endPC.
	_gsSqueakTemp_hash := self species hash + self header + _gsSqueakTemp_initialPC + _gsSqueakTemp_endPC + self methodClass hash bitAnd: 268435455.
	"sample approximately 20 bytes"
	_gsSqueakTemp_initialPC
		to: _gsSqueakTemp_endPC
		by: (_gsSqueakTemp_endPC - _gsSqueakTemp_initialPC // 20 max: 1)
		do: [:i | _gsSqueakTemp_hash := _gsSqueakTemp_hash
						+ (self at: i)].
	^ _gsSqueakTemp_hash"(CompiledMethod>>#hash) hash"