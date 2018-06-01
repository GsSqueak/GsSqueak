accessing
referencesToIt: aClassName 
	| binding environment |
	environment := self selectedEnvironment.
	binding := (environment bindingOf: aClassName) ifNil: [ ^ self ].
	self systemNavigation browseAllCallsOn: binding