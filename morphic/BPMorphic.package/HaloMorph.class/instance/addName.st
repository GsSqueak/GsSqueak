private
addName
	"Add a name readout at the bottom of the halo."
	Preferences uniqueNamesInHalos
		ifTrue: [target assureExternalName].
	self addNameBeneath: self basicBox string: target externalName