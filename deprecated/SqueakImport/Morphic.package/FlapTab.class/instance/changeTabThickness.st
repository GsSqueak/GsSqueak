solid tabs
changeTabThickness
	| newThickness |
	newThickness := UIManager default request: 'New thickness:'
				initialAnswer: self tabThickness printString.
	newThickness notEmpty ifTrue: [self applyTabThickness: newThickness]