layout
updateLayout

	self textMorph fullBounds.
	self extent: self textMorph extent + (2* self bubbleInset) +  (0 @ (2*self tailHeight)).
	self textMorph center: self center.