geometry
handleResizeAction: aBlock
	"Ensure layout properties after resizing takes place."
	
	| oldExtent |	
	oldExtent := self extent.
	
	aBlock value ifFalse: [^ self].
	
	"Now reset widget sizes"
	self extent ~= oldExtent ifTrue: [
		self
			resizeScrollBars;
			resizeScroller;
			setScrollDeltas].