system startup
resetAllHistory
	"Reset all command histories, and make all morphs that might be holding on to undo-grab-commands forget them"

	self allInstancesDo: [:c | c resetCommandHistory].
	MorphExtension withAllSubclassesDo:
		[:morphExtensionClass|
		 morphExtensionClass allInstancesDo:
			[:object| object removeProperty: #undoGrabCommand]]

	"CommandHistory resetAllHistory"
