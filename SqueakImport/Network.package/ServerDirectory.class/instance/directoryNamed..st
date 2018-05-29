file directory
directoryNamed: localFileName 
	"Return a copy of me pointing at this directory below me"
	| new newPath newAltUrl |
	new := self copy.
	urlObject
		ifNotNil: [new urlObject path: new urlObject path copy.
			new urlObject path removeLast; addLast: localFileName; addLast: ''.
			^ new].
	"sbw.  When working from an FTP server, the first time we access
	a subdirectory the <directory> variable is empty.  In that case we
	cannot begin with a leading path delimiter since that leads us to
	the wrong place."
	newPath := directory isEmpty
				ifTrue: [localFileName]
				ifFalse: [directory , self pathNameDelimiter asString , localFileName].
	self altUrl ifNotNil: [
		newAltUrl := self altUrl, self pathNameDelimiter asString , localFileName].
	new directory: newPath; altUrl: newAltUrl.
	^ new