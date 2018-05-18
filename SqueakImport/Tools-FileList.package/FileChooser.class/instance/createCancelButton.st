ui creation
createCancelButton
	cancelButton := SimpleButtonMorph new.
	cancelButton
		label: 'Cancel' translated;
		color: Color transparent;
		borderColor: Color black;
		borderWidth: 1.
	cancelButton 
		on: #mouseUp 
		send: #cancelHit
		to: self.
	^cancelButton
