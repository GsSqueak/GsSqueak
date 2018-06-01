private
setFrame: newFrameIndex 
	| oldFrame p newFrame |
	oldFrame := self currentFrame.
	oldFrame ifNil: [^self].
	self changed.
	p := oldFrame referencePosition.
	currentFrameIndex := newFrameIndex.
     currentFrameIndex :=  currentFrameIndex min: (frameList size). 
	currentFrameIndex := currentFrameIndex max: 1.
	newFrame := frameList at: currentFrameIndex.
	newFrame referencePosition: p.
	oldFrame delete.
	self addMorph: newFrame.
	dwellCount := newFrame framesToDwell.
	self layoutChanged.
	self changed