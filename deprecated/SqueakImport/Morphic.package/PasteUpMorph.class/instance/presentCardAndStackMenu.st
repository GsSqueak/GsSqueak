menu & halo
presentCardAndStackMenu
	"Put up a menu holding card/stack-related options."

	| aMenu |
	aMenu := MenuMorph new defaultTarget: self.		
	aMenu addStayUpItem.
	aMenu addTitle: 'card and stack' translated.
	aMenu add: 'add new card' translated action: #insertCard.
	aMenu add: 'delete this card' translated action: #deleteCard.
	aMenu add: 'go to next card' translated action: #goToNextCardInStack.
	aMenu add: 'go to previous card' translated action: #goToPreviousCardInStack.
	aMenu addLine.
	aMenu add: 'show foreground objects' translated action: #showForegroundObjects.
	aMenu add: 'show background objects' translated action: #showBackgroundObjects.
	aMenu add: 'show designations' translated action: #showDesignationsOfObjects.
	aMenu add: 'explain designations'  translated action: #explainDesignations.
	aMenu popUpInWorld: (self world ifNil: [self currentWorld])