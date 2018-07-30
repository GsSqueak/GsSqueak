interface
okToClose

	| choice |
	choice := (UIManager default
				chooseFrom: #('Commit' 'Discard' 'Cancel')
				title: 'Do you want to commit or discard your changes?').
	choice = 1 ifTrue: [ self commitTransaction ].
	choice = 2 ifTrue: [ self abortTransaction ].
	(choice = 0 or: [ choice = 3 ]) ifTrue: [ ^ false ].
	^ true