accessing
moduleName
	"e.g. libgcits-3.5.0-64.so"
	^ 'libgcits-{1}-{2}.{3}' 
		format: {
			self gemStoneVersion.
			self wordSize * 8.
			self libraryExtension}