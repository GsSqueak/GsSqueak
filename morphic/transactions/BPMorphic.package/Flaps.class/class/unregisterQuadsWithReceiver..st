flaps registry
unregisterQuadsWithReceiver: aReceiver 
	"delete all quads with receiver aReceiver."
	self registeredFlapsQuads
		do: [:assoc | assoc value
				removeAllSuchThat: [:q | (self environment
						at: q first
						ifAbsent: [])
						= aReceiver]]