instance creation
onClass: morphClass

	^ self new
		morphClass: morphClass;
		updateMorph;
		yourself