*VMMaker-translation
requiresConcreteImplementation
	| marker |
	marker := self markerOrNil.
	^ marker notNil and: [marker = #subclassResponsibility].