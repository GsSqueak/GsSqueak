objects from disk
convertToCurrentVersion: varDict refStream: smartRefStrm
	
	"20 dec 2000 - only a few (old) conversion exists"

	varDict at: 'mouseEnterLadenRecipient' ifPresent: [ :x | mouseEnterDraggingRecipient := x].
	varDict at: 'mouseEnterLadenSelector' ifPresent: [ :x | mouseEnterDraggingSelector := x].
	varDict at: 'mouseLeaveLadenRecipient' ifPresent: [ :x | mouseLeaveDraggingRecipient := x].
	varDict at: 'mouseLeaveLadenSelector' ifPresent: [ :x | mouseLeaveDraggingSelector := x].
	^super convertToCurrentVersion: varDict refStream: smartRefStrm.

