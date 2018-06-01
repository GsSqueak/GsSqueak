initialization
openNear: aRectangle in: aWorld
	| wb leftOverlap rightOverlap topOverlap bottomOverlap best |
	wb := aWorld bounds.
	self fullBounds.
	leftOverlap := self width - (aRectangle left - wb left).
	rightOverlap := self width - (wb right - aRectangle right).
	topOverlap := self height - (aRectangle top - wb top).
	bottomOverlap := self height - (wb bottom - aRectangle bottom).
	best := nil.
	{
		{leftOverlap. #topRight:. #topLeft}.
		{rightOverlap. #topLeft:. #topRight}.
		{topOverlap. #bottomLeft:. #topLeft}.
		{bottomOverlap. #topLeft:. #bottomLeft}.
	} do: [ :tuple |
		(best isNil or: [tuple first < best first]) ifTrue: [best := tuple].
	].
	self perform: best second with: (aRectangle perform: best third).
	self bottom: (self bottom min: wb bottom) rounded.
	self right: (self right min: wb right) rounded.
	self top: (self top max: wb top) rounded.
	self left: (self left max: wb left) rounded.
	self openInWorld: aWorld.