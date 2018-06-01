file directory
pathName
	"Path name as used in reading the file.  with slashes for ftp, with local file delimiter (:) for a file: url"

	urlObject ifNotNil: [^ urlObject pathForFile].
	directory size = 0 ifTrue: [^ server].
	^ (directory at: 1) = self pathNameDelimiter
		ifTrue: [server, directory]
		ifFalse: [user, '@', server, self pathNameDelimiter asString, directory]