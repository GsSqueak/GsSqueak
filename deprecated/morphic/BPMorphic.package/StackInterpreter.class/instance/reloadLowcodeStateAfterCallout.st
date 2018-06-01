inline primitive ffi abi
reloadLowcodeStateAfterCallout
	| _gsSqueakTemp_calloutStateSize _gsSqueakTemp_initialShadowCallStackPointer |
	_gsSqueakTemp_calloutStateSize := self sizeof: #sqLowcodeCalloutState.
	_gsSqueakTemp_initialShadowCallStackPointer := (self shadowCallStackPointerIn: localFP)
				- 1.
	_gsSqueakTemp_initialShadowCallStackPointer := self
				cCoerce: ((self cCoerce: _gsSqueakTemp_initialShadowCallStackPointer - _gsSqueakTemp_calloutStateSize to: 'size_t')
						bitAnd: -16)
				to: 'char*'.
	lowcodeCalloutState := self cCoerce: _gsSqueakTemp_initialShadowCallStackPointer to: #'sqLowcodeCalloutState*'