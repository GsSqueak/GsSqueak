button actions
okToClose
	
	| choice |
	self repository needsCommit 
		ifTrue: [ 
			choice := (UIManager default
						chooseFrom: #('Commit' 'Discard' 'Cancel')
						title: 'You have uncommited changes. Do you want to commit or discard those changes?').
			
			choice = 1 ifTrue: [ self commitTransaction ].
			choice = 2 ifTrue: [ self abortTransaction ].
			(choice = 0 or: [ choice = 3 ]) ifTrue: [ ^ false ]].
		
	^ super okToClose
	
	