actions
brush: brushButton action: aSelector nib: aMask evt: evt 
	"Set the current tool and action for the paintBox. "
	currentBrush
		ifNotNil: [currentBrush == brushButton
				ifFalse: [currentBrush state: #off]].
	currentBrush := brushButton.
	"A ThreePhaseButtonMorph"
	"currentBrush state: #on.	already done"
	"aSelector is like brush3:. Don't save it. Can always say (currentBrush
	arguments at: 2)
	aMask is the brush shape. Don't save it. Can always say (currentBrush
	arguments at: 3)"
	self notifyWeakDependentsWith: {#currentNib. evt. currentBrush arguments third}.
	self brushable
		ifFalse: [self setAction: #paint: evt: evt
			"User now thinking of painting"]