frame access
frameHasNativeFrame: theFP 
	"See encodeFrameFieldHasContext:numArgs:"
	| _gsSqueakTemp_markObject |
	_gsSqueakTemp_markObject := self
				temporary: (self frameNumArgs: theFP)
				in: theFP.
	^ _gsSqueakTemp_markObject ~= objectMemory nilObject
		and: [_gsSqueakTemp_markObject
				= (objectMemory splObj: LowcodeContextMark)]