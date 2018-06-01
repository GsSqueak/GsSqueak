actions
accept
	"if the user submits with no valid entry, make them start over"
	
	| choice |
	self canAccept ifFalse: [
		self canAdd ifTrue: [^ self add].
		^ self changed: #textSelection].
	
	choice := self selectedItem.
	
	self canAdd ifTrue: [
		"Ask the user whether to add the new item or choose the list selection."
		(UserDialogBoxMorph confirm: 'You can either choose an existing item or add a new one.\What do you want?' translated withCRs title: 'Choose or Add' translated trueChoice: choice asString falseChoice: self searchText asString at: ActiveHand position)
			ifTrue: [self result: choice] ifFalse: [self result: self searchText asString]
		] ifFalse: [self result: choice].
		
	
	self changed: #close.