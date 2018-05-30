file name utilities
fileNamesMatching: pat
	"
	FileDirectory default fileNamesMatching: '*'
	FileDirectory default fileNamesMatching: '*.image;*.changes'
	"
	
	| files fileNames |
	files := OrderedCollection new.
	fileNames := self fileNames.
	(pat findTokens: ';', String crlf) do:
		[:tok | 
		files addAll: (fileNames select: [:name | tok match: name])].
	^files