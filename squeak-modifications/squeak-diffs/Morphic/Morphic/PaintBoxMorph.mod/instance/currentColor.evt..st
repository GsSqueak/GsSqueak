actions
currentColor: aColor evt: evt
	"Accept a color from the outside.  (my colorMemoryMorph must call takeColorEvt: evt from: colorPicker instead)"

	currentColor := aColor.
	colorMemory currentColor: aColor.
	self notifyWeakDependentsWith: {#currentColor. evt. currentColor}.
	self showColor.
	self colorable ifFalse: [self setAction: #paint: evt: evt].	"User now thinking of painting"