debug support
checkOkayStackZone: writeBack 
	"Check that all objects in the stack zone are okay"
	| _gsSqueakTemp_ok _gsSqueakTemp_thePage |
	writeBack
		ifTrue: [self externalWriteBackHeadFramePointers].
	_gsSqueakTemp_ok := true.
	0
		to: numStackPages - 1
		do: [:i | 
			_gsSqueakTemp_thePage := stackPages stackPageAt: i.
			(stackPages isFree: _gsSqueakTemp_thePage)
				ifFalse: [_gsSqueakTemp_ok := _gsSqueakTemp_ok
								& (self checkOkayStackPage: _gsSqueakTemp_thePage)]].
	^ _gsSqueakTemp_ok