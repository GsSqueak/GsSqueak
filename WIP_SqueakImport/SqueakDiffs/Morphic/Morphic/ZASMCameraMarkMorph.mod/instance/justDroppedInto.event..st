dropping/grabbing
justDroppedInto: newOwner event: anEvent

	| holder |

	newOwner isWorldMorph ifTrue: [
		holder := ZASMScriptMorph new.
		holder 
			position: self position;
			setProperty: #cameraController toValue: self cameraController.
		self world addMorph: holder.
		holder addMorph: self.
		holder startStepping.
	].
	super justDroppedInto: newOwner event: anEvent