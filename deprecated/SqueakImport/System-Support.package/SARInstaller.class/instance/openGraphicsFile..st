client services
openGraphicsFile: memberOrName
	| member morph |
	member := self memberNamed: memberOrName.
	member ifNil: [ ^self errorNoSuchMember: memberOrName ].
	morph := (Project current world drawingClass fromStream: member contentStream binary).
	morph ifNotNil: [ morph openInWorld ].
	self installed: member.