class initialization
initialize
	"register the receiver in the global registries"
	self environment
		at: #FileList
		ifPresent: [:cl | cl registerFileReader: self]