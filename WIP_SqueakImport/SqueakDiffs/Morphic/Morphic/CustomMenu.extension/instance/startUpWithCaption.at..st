*Morphic-invocation
startUpWithCaption: caption at: aPoint 
	"Build and invoke this menu with no initial selection. Answer the  
	selection associated with the menu item chosen by the user or nil if  
	none is chosen; use the provided caption"
	^ self startUp: nil withCaption: caption at: aPoint