menu
preserveDetails
	"The receiver is being switched to use a different format. Preserve the
	existing details (e.g. wording if textual, grapheme if graphical) so that
	if the user reverts back to the current format, the details will be right"
	| _gsSqueakTemp_thickness |
	color = Color transparent
		ifFalse: [self setProperty: #priorColor toValue: color].
	self isCurrentlyTextual
		ifTrue: [self setProperty: #priorWording toValue: self existingWording]
		ifFalse: [self isCurrentlyGraphical
				ifTrue: [self setProperty: #priorGraphic toValue: submorphs first form]
				ifFalse: [_gsSqueakTemp_thickness := self orientation == #vertical
								ifTrue: [self width]
								ifFalse: [self height].
					self setProperty: #priorThickness toValue: _gsSqueakTemp_thickness]]