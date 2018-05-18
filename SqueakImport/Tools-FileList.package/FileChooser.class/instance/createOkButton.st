ui creation
createOkButton
	okButton := SimpleButtonMorph new.
	okButton 
		label: 'Open' translated;
		color: Color transparent;
		borderColor: Color black;
		borderWidth: 1.
	okButton 
		on: #mouseUp 
		send: #okHit
		to: self.
	^okButton