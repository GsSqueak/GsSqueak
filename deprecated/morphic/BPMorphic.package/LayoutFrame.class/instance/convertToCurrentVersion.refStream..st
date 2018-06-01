objects from disk
convertToCurrentVersion: varDict refStream: smartRefStrm 
	"JW 2/1/2001"
	"Since class version isn't passed in varDict, look it up through
	smartRefSrm. "
	| _gsSqueakTemp_className _gsSqueakTemp_oldClassVersion |
	_gsSqueakTemp_className := varDict at: #ClassName.
	_gsSqueakTemp_oldClassVersion := (smartRefStrm structures at: _gsSqueakTemp_className) first.
	_gsSqueakTemp_oldClassVersion = 0
		ifTrue: [self negateBottomRightOffsets].
	^ super convertToCurrentVersion: varDict refStream: smartRefStrm