button actions
okToClose
	
	| choice |
	self session needsCommit 
		ifTrue: [ 
			choice := (UIManager getDefault 
						chooseFrom: #(Commit Abort Cancel)
						title: 'You have uncommited changes. Do you want to commit or cancel those changes?').
			
			choice = 1 ifTrue: [ self session commit ].
			choice = 2 ifTrue: [ self session abort ].
			(choice = 0 or: [ choice = 3 ]) ifTrue: [ ^ false ]].
		
	^ super okToClose
	
	