printing
addSubProjectNamesTo: aStream indentation: anIndentation
	"Add the names of the receiver and all its subprojects, and all *their* subprojects recursively, to aStream, indenting by the specified number of tab stops "

	self isTopProject ifFalse:  "circumvent an annoying cr at the top "
		[aStream cr].  
	aStream tab: anIndentation; nextPutAll: self name.
	self subProjects do:
		[:p |
			p addSubProjectNamesTo: aStream indentation: anIndentation + 1]