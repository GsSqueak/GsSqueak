downloading
retrieveContents
	| file pathString s type entries |
	pathString := self pathForFile.
	file := [FileStream readOnlyFileNamed: pathString] 
			on: FileDoesNotExistException do:[:ex| ex return: nil].
	file ifNotNil: [
		type := file mimeTypes.
		type ifNotNil:[type := type first].
		type ifNil:[type := MIMEDocument guessTypeFromName: self path last].
		^MIMELocalFileDocument 
			contentType: type
			contentStream: file].

	"see if it's a directory..."
	entries := [(FileDirectory on: pathString) entries] 
				on: InvalidDirectoryError do:[:ex| ex return: nil].
	entries ifNil:[^nil].

	s := WriteStream on: String new.
	(pathString endsWith: '/') ifFalse: [ pathString := pathString, '/' ].
	s nextPutAll: '<title>Directory Listing for ', pathString, '</title>'.
	s nextPutAll: '<h1>Directory Listing for ', pathString, '</h1>'.
	s nextPutAll: '<ul>'.
	s cr.
	entries do: [ :entry |
		s nextPutAll: '<li><a href="'.
		s nextPutAll: entry name.
		s nextPutAll: '">'.
		s nextPutAll: entry name.
		s nextPutAll: '</a>'.
		s cr. ].
	s nextPutAll: '</ul>'.
	^MIMEDocument  contentType: 'text/html'  content: s contents  url: ('file://', pathString)