private
inAContainer
	"Answer the receiver contained in a proper container"
	| container |
	container := self createContainer.
	container addMorphBack: self.
	" 
	nasty hack to force the scroolbar recreation"
	self extent: container extent - container borderWidth.
	""
	^ container