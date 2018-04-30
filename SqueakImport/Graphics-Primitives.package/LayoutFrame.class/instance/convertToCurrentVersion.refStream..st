objects from disk
convertToCurrentVersion: varDict refStream: smartRefStrm
	| className oldClassVersion |

	"JW 2/1/2001"
	"Since class version isn't passed in varDict, look it up through smartRefSrm."
	className := varDict at: #ClassName.
	oldClassVersion := (smartRefStrm structures at: className) first.
	(oldClassVersion = 0) ifTrue: [ self negateBottomRightOffsets ].
	^super convertToCurrentVersion: varDict refStream: smartRefStrm.
