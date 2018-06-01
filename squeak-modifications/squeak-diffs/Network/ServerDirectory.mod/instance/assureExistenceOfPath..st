file directory
assureExistenceOfPath: localPath
	"Make sure the local directory exists. If necessary, create all parts inbetween"

	localPath = (String with: self pathNameDelimiter) ifTrue: [^self].
	self assureExistence.
	(self localPathExists: localPath) ifFalse: [
		self createDirectory: localPath].