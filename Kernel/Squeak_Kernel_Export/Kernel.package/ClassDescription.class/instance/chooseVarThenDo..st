instance variables
chooseVarThenDo: aBlock 
	"Put up a menu of all the instance variables in the receiver, and when
the user chooses one, evaluate aBlock with the chosen variable as its
parameter."
	| lines labelStream allVars index |
	(self allInstVarNames size + self theNonMetaClass allClassVarNames size) = 0 ifTrue: [ ^ self inform: 'There are no variables.' ].
	allVars := OrderedCollection new.
	lines := OrderedCollection new.
	labelStream := WriteStream on: (String new: 200).
	self withAllSuperclasses reverseDo:
		[ : class | | vars |
		vars := class instVarNames , class theNonMetaClass classVarNames.
		vars do:
			[ : var | labelStream
				 nextPutAll: var ;
				 cr.
			allVars add: var ].
		vars isEmpty ifFalse: [ lines add: allVars size ] ].
	labelStream skip: -1.
	"cut last CR"
	(lines size > 0 and: [ lines last = allVars size ]) ifTrue: [ lines removeLast ].
	"dispense with inelegant line beneath last item"
	index := UIManager default
		chooseFrom: (labelStream contents subStrings: {Character cr})
		lines: lines
		title: 'Variables in ' , self name.
	index = 0 ifTrue: [ ^ self ].
	aBlock value: (allVars at: index)