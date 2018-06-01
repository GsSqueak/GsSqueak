accessing
resourceFileNames
	"Return a list of all the resource files created"
	^locatorMap values asArray collect:[:loc| loc localFileName].