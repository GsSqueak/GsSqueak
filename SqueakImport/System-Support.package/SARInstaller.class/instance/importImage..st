client services
importImage: memberOrName
	| member form |
	member := self memberNamed: memberOrName.
	member ifNil: [ ^self errorNoSuchMember: memberOrName ].
	form := ImageReadWriter formFromStream: member contentStream binary.
	form ifNil: [ ^self ].
	Imports default importImage: form named: (FileDirectory localNameFor: member fileName) sansPeriodSuffix.
	self installed: member.