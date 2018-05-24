query
allReferencesToPool: aPool from: aClass
	"Answer all the references to variables from aPool"
	| list |
	list := OrderedCollection new.
	aClass withAllSubclassesDo:[:cls|
		cls selectorsAndMethodsDo:[:sel :meth|
			(meth hasLiteralSuchThat: [:lit| lit isVariableBinding and:[(aPool bindingOf: lit key) notNil]]) ifTrue:
				[list add:(MethodReference class: cls selector: sel)]]].
	^list