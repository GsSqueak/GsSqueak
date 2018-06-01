file directory
assureExistenceOfPath: lPath
	"Make sure the local directory exists. If necessary, create all parts in between"
	| localPath |
	localPath := lPath.
	localPath isEmpty ifTrue: [ ^self ]. "Assumed to exist"
	self assureExistence.
	(self directoryExists: localPath) ifTrue: [^ self]. "exists"
	self createDirectory: localPath