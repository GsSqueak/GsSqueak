file name utilities
directoryNamesMatching: pat
	"
	FileDirectory default directoryNamesMatching: '*'
	FileDirectory default directoryNamesMatching: '*_segs'
	"
	
	| directories directoryNames |
	directories := OrderedCollection new.
	directoryNames := self directoryNames.
	(pat findTokens: ';', String crlf) do:
		[:tok | 
		directories addAll: (directoryNames select: [:name | tok match: name])].
	^directories