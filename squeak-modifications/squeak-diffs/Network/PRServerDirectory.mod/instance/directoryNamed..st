file directory
directoryNamed: aString 
	"Return the subdirectory of this directory with the given name."
	^ self class server: self server directory: self directory , self slash, aString