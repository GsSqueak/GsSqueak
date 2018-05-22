file stream creation
oldFileOrNoneNamed: localFileName
	"If the file exists, answer a read-only FileStream on it. If it doesn't, answer nil."

	^ FileStream concreteStream oldFileOrNoneNamed: (self fullNameFor: localFileName)
