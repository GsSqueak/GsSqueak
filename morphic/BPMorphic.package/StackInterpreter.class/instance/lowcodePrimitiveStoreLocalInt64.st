inline primitive generated code
lowcodePrimitiveStoreLocalInt64
	"Lowcode instruction generator"
	| _gsSqueakTemp_valueInt64 |
	BytesPerWord = 4
		ifTrue: [self
				lowcodeStoreLocalInt64Workaround: extA
				in: localFP
				sp: localSP]
		ifFalse: [_gsSqueakTemp_valueInt64 := self internalPopStackInt64.
			stackPages
				int64AtPointer: (self framePointerOfNativeLocal: extA in: localFP)
				put: _gsSqueakTemp_valueInt64].
	extA := 0