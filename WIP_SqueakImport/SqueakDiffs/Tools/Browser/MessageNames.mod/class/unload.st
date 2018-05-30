*Morphic-MorphicExtras-class initialization
unload
	"Unload the receiver from global registries"

	self environment at: #FileList ifPresent: [:cl |
	cl unregisterFileReader: self].
	self environment at: #Flaps ifPresent: [:cl |
	cl unregisterQuadsWithReceiver: self] 