miscellaneous
setFlexExtentFromHalo: anExtent 
	"The user has dragged the grow box such that the receiver's extent
	would be anExtent. Do what's needed. Set the extent of the top
	renderer as indicated."
	self addFlexShellIfNecessary.
	self topRendererOrSelf extent: anExtent