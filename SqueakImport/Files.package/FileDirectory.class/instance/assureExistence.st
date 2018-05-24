file directory
assureExistence
	"Make sure the current directory exists. If necessary, create all parts in between"
	self exists ifFalse:
		[ self containingDirectory
			 assureExistence ;
			 createDirectory: self localName.
		self exists ifFalse: [ Error signal: self fullName, ' could not be created.  Permissions?' ] ]