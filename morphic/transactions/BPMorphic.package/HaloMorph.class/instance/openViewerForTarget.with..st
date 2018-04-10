handles
openViewerForTarget: evt with: aHandle 
	"Open a viewer for my inner target or if shift pressed make a snapshot
	of morph."
	self obtainHaloForEvent: evt andRemoveAllHandlesBut: nil.
	evt shiftPressed
		ifTrue: [target duplicateMorphImage: evt]
		ifFalse: [innerTarget openViewerForArgument]