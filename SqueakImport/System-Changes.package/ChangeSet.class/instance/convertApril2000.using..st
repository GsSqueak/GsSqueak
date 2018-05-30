converting
convertApril2000: varDict using: smartRefStrm
	| classChanges methodChanges methodRemoves classRemoves cls info |
	"These variables are automatically stored into the new instance:
		('name' 'preamble' 'postscript' 'structures' 'superclasses' ).
	This method is for additional changes.
	It initializes the isolation variables, and then duplicates the logic fo
		assimilateAllChangesFoundIn:."

	revertable := false.
	isolationSet := nil.
	isolatedProject := nil.
	changeRecords := Dictionary new.

	classChanges := varDict at: 'classChanges'.
	classChanges keysDo:
		[:className |
	  	(cls := Smalltalk classNamed: className) ifNotNil:
			[info := classChanges at: className ifAbsent: [Set new].
			info do: [:each | self atClass: cls add: each]]].

	methodChanges := varDict at: 'methodChanges'.
	methodRemoves := varDict at: 'methodRemoves'.
	methodChanges keysDo:
		[:className |
	  	(cls := Smalltalk classNamed: className) ifNotNil:
			[info := methodChanges at: className ifAbsent: [Dictionary new].
			info associationsDo:
				[:assoc | | selector pair | selector := assoc key.
				(assoc value == #remove or: [assoc value == #addedThenRemoved])
					ifTrue:
						[assoc value == #addedThenRemoved
							ifTrue: [self atSelector: selector class: cls put: #add].
						pair := methodRemoves at: {cls name. selector} ifAbsent: [nil] .
						self removeSelector: selector class: cls priorMethod: nil lastMethodInfo: pair]
					ifFalse: 
						[self atSelector: selector class: cls put: assoc value]]]].

	classRemoves := varDict at: 'classRemoves'.
	classRemoves do:
		[:className | self noteRemovalOf: className].

