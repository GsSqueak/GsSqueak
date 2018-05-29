as yet unclassified
actOnClickFor: model
	"Subclasses may override to provide, eg, hot-spot actions"

	model doJumpTo: jumpLabel.
	^ true