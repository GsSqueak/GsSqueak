-Etoys-support
noteNegotiatedName: uniqueName for: requestedName 
	"This works, kind of, for morphs that have a single variable. Still
	holding out for generality of morphs being able to have multiple
	variables, but need a driving example"
	self setProperty: #variableName toValue: uniqueName.
	self setProperty: #setterSelector toValue: uniqueName asSetterSelector.
	self setNameTo: uniqueName