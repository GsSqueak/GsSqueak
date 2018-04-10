actions
takeColor: aColor event: evt 
	"Accept the given color programmatically"
	currentColor := aColor.
	self notifyWeakDependentsWith: {#currentColor. evt. currentColor}.
	self showColor.
	self colorable
		ifFalse: [self setAction: #paint: evt: evt]