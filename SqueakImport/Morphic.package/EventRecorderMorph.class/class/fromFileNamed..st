instance creation
fromFileNamed: aFileName
	| file answer |
	file := FileStream readOnlyFileNamed: aFileName.
	answer := self readFrom: file setConverterForCode.
	file close.
	^ answer