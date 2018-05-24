private
selectedItem

	(selectedItem notNil and: [ 
		selectedItem isSelected ]) ifTrue: [ 
			^selectedItem ].
	^ nil