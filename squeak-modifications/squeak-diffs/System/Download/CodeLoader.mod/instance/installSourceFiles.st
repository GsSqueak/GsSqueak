installing
installSourceFiles
	"Install the previously loaded source files"
	sourceFiles == nil ifTrue:[^self].
	sourceFiles do:[:req| self installSourceFile: req contentStream].
	sourceFiles := nil.