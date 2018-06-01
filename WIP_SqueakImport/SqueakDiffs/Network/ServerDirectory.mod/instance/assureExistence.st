file directory
assureExistence
	"Make sure the current directory exists. If necessary, create all parts inbetween"
	
	self exists ifFalse: [
		self isRoot ifFalse: [
			self containingDirectory assureExistenceOfPath: self localName]]