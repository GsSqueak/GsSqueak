*Morphic-invocation
startUp: initialSelection withCaption: caption at: aPoint 
	"Build and invoke this menu with the given initial selection and caption. 
	Answer the selection associated with the menu item chosen by the user 
	or nil if none is chosen."
	self build.
	initialSelection notNil
		ifTrue: [self preSelect: initialSelection].
	^ super startUpWithCaption: caption at: aPoint