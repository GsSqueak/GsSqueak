flaps registry
unregisterQuad: aQuad forFlapNamed: aLabel 
	"If any previous registration at the same label string has the same
	receiver-command, delete the old one."
	(self registeredFlapsQuadsAt: aLabel)
		removeAllSuchThat: [:q | q first = aQuad first
				and: [q second = aQuad second]]