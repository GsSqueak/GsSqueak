events-processing
handleListenEvent: anEvent
	"Transmit the event to interested listeners"
	| currentExtent |
	currentExtent := self worldBounds extent.
	self lastWorldExtent ~= currentExtent ifTrue: [
		self transmitEvent: (MorphicUnknownEvent new setType: #worldExtent argument: currentExtent).
		self lastWorldExtent: currentExtent].
	self transmitEvent: anEvent.