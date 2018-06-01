flaps registry
unregisterQuadsWithReceiver: aReceiver fromFlapNamed: aLabel 
	"delete all quads with receiver aReceiver."
	(self registeredFlapsQuads at: aLabel)
		removeAllSuchThat: [:q | q first = aReceiver name]