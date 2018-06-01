private
askForSuperclassOf: aClass upTo: superclass toImplement: aSelector ifCancel: cancelBlock
	| classes chosenClassIndex |
	classes := aClass withAllSuperclasses reject: [:cls | aClass isKindOf: cls].
	chosenClassIndex := UIManager default 
		chooseFrom: (classes collect: [:c | c name])
		title: 'Define #', aSelector, ' in which class?'.
	chosenClassIndex = 0 ifTrue: [^ cancelBlock value].
	^ classes at: chosenClassIndex