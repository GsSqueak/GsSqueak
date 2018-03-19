drawing
alphaHandle
	handleColor
		ifNil: [handleColor := self passiveForm].
	"The following line is only needed on first load, so existing windows
	don't blow up from the new handles. 
	Can safely be deleted along with this comment in a later update"
	handleColor class == Form
		ifFalse: [handleColor := self passiveForm].
	^ handleColor