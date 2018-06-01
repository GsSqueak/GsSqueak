ui creation
createSystemWindowButtonPane
	"Create buttons suitable for a SystemWindow file chooser."

	self optionalButtonSpecs: self okayAndCancelServices.
	buttonPane := self optionalButtonRow.
	okButton := buttonPane firstSubmorph.
	cancelButton := buttonPane firstSubmorph.
	^buttonPane