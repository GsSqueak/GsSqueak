drag and drop
acceptDroppingMorph: aTransferMorph event: evt

	dropItemSelector ifNil: [^ self].
	potentialDropRow ifNil: [^ self].
	
	model
		perform: dropItemSelector
		withEnoughArguments: {
			aTransferMorph passenger.
			self modelIndexFor: potentialDropRow.
			aTransferMorph shouldCopy.
			aTransferMorph}.
			
	self resetPotentialDropRow.
	evt hand releaseMouseFocus: self.
	Cursor normal show.
