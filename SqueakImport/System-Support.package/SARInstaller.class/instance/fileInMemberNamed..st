client services
fileInMemberNamed: csName
	"This is to be used from preamble/postscript code to file in zip members as ChangeSets."
	| cs |
	cs := self memberNamed: csName.
	cs ifNil: [ ^self errorNoSuchMember: csName ].
	self class fileIntoChangeSetNamed: csName fromStream: cs contentStream text setConverterForCode.
	self installed: cs.
