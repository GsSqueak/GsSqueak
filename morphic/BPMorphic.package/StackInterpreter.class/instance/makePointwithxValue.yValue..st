utilities
makePointwithxValue: xValue yValue: yValue 
	"make a Point xValue@yValue.
	We know both will be integers so no value nor root checking is
	needed "
	| _gsSqueakTemp_pointResult |
	_gsSqueakTemp_pointResult := objectMemory
				eeInstantiateSmallClass: (objectMemory splObj: ClassPoint)
				numSlots: YIndex + 1.
	objectMemory
		storePointerUnchecked: XIndex
		ofObject: _gsSqueakTemp_pointResult
		withValue: (objectMemory integerObjectOf: xValue).
	objectMemory
		storePointerUnchecked: YIndex
		ofObject: _gsSqueakTemp_pointResult
		withValue: (objectMemory integerObjectOf: yValue).
	^ _gsSqueakTemp_pointResult