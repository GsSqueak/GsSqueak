message sending
getErrorObjectFromPrimFailCode
	"Answer the errorCode object to supply to a failing primitive method
	that accepts one.
	If there is a primitive error table and the primFailCode is a valid index
	there-in answer
	the corresponding entry in the table, otherwise simply answer the
	code as an integer."
	| _gsSqueakTemp_table _gsSqueakTemp_errObj _gsSqueakTemp_numSlots |
	primFailCode > 0
		ifTrue: [_gsSqueakTemp_table := objectMemory splObj: PrimErrTableIndex.
			primFailCode
					<= (objectMemory numSlotsOf: _gsSqueakTemp_table)
				ifTrue: [_gsSqueakTemp_errObj := objectMemory followField: primFailCode - 1 ofObject: _gsSqueakTemp_table.
					"If this is a PrimErrOSError and there's a clonable
					object in the table at that index,
					answer a clone of the error object with the second slot
					set to the value of osErrorCode."
					(primFailCode = PrimErrOSError
							and: [(objectMemory formatOf: _gsSqueakTemp_errObj)
										= objectMemory nonIndexablePointerFormat
									and: [(_gsSqueakTemp_numSlots := objectMemory numSlotsOf: _gsSqueakTemp_errObj) >= 2]])
						ifTrue: [_gsSqueakTemp_errObj := self cloneOSErrorObj: _gsSqueakTemp_errObj numSlots: _gsSqueakTemp_numSlots].
					^ _gsSqueakTemp_errObj]].
	^ objectMemory integerObjectOf: primFailCode