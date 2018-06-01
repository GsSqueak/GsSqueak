inline primitive ffi abi
allocateLowcodeCalloutState
	| _gsSqueakTemp_calloutStateSize |
	_gsSqueakTemp_calloutStateSize := self sizeof: #sqLowcodeCalloutState.
	shadowCallStackPointer := self
				cCoerce: ((self cCoerce: shadowCallStackPointer - _gsSqueakTemp_calloutStateSize to: 'size_t')
						bitAnd: -16)
				to: 'char*'.
	lowcodeCalloutState := self cCoerce: shadowCallStackPointer to: #'sqLowcodeCalloutState*'