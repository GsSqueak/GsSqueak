-Tools
printOutMessage
	"Write a file with the text of the selected message, for printing by a
	web browser"
	self selectedMessageName
		ifNotNil: [self selectedClassOrMetaClass fileOutMethod: self selectedMessageName asHtml: true]