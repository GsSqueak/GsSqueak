top window
comeToFront
	"Modal windows: Walk along the modal owner chain, the bring all to
	top. "
	self modalOwner
		ifNotNil: [:mo | mo isSystemWindow
				ifTrue: [^ mo modalOwner
						ifNil: [mo comeToFrontModally]
						ifNotNil: [:omo | omo comeToFront]]].
	self modalChild
		ifNotNil: [^ self comeToFrontModally].
	"Now show me."
	super comeToFront.
	"Label should be visible to interact with."
	self assureLabelAreaVisible.
	"Handle historic companions. May be removed in the future."
	self extantSketchEditor
		ifNotNil: [:sketchEditor | 
			sketchEditor comeToFront.
			(self world findA: PaintBoxMorph)
				ifNotNil: [:pal | pal comeToFront]]