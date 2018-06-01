-Etoys-card in a stack
variableDocks
	"Answer a list of VariableDocker objects for docking up my data with
	an instance held in my containing playfield. The simple presence of
	some objects on a Playfield will result in the maintenance of instance
	data on the corresponding Card. This is a generalization of the
	HyperCard 'field' idea. If there is already a cachedVariableDocks
	cached, use that. For this all to work happily, one must be certain to
	invalidate the #cachedVariableDocks cache when that's appropriate."
	^ self
		valueOfProperty: #cachedVariableDocks
		ifAbsent: [#()]