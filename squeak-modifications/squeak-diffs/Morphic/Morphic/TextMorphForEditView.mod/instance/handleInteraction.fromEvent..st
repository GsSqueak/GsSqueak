editing
handleInteraction: interActionBlock fromEvent: evt
	"Overridden to pass along a model to the editor for, eg, link resolution, doits, etc"

	self editor model: editView model.  "For evaluateSelection, etc"
	^ super handleInteraction: interActionBlock fromEvent: evt