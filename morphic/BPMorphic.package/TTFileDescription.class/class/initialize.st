class initialization
initialize
	"TTFileDescription initialize"
	Smalltalk addToShutDownList: self.
	FontPaths := Dictionary new.
	AllFontsAndFiles := nil