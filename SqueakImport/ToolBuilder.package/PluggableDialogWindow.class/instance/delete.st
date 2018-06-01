submorphs-add/remove
delete

	self model okToClose ifFalse: [^ self].
	
	self closeDialogSelector ifNotNil: [:sel | self model perform: sel].
	
	self model
		windowIsClosing;
		release.
	self model: nil.
	
	super delete.