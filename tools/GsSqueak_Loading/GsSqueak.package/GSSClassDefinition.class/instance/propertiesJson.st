fileout
propertiesJson

	| dict |
	dict := Dictionary new.
	instVars ifNotNil: [:vars | dict at: 'instVars' put: vars].
	classVars ifNotNil: [:vars | dict at: 'classVars' put: vars].
	classInstVars ifNotNil: [:vars | dict at: 'classInstVars' put: vars].
	name ifNotNil: [:name | dict at: 'name' put: name].
	pools ifNotNil: [:pools | dict at: 'pools' put: pools].
	superclass ifNotNil: [:superclassName | dict at: 'super' put: superclassName].
	type ifNotNil: [:type | dict at: 'type' put: type].
	category ifNotNil: [:cat | dict at: 'category' put: cat].
	commentStamp ifNotNil: [:cmtStmp | dict at: 'commentStamp' put: cmtStmp].
	
	^ String streamContents: [:aStream | dict writeCypressJsonOn: aStream]
	