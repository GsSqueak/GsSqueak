meta-actions
copyToPasteBuffer: evt
	self okayToDuplicate ifTrue:[evt hand copyToPasteBuffer: self].