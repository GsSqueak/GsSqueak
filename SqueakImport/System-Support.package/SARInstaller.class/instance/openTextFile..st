client services
openTextFile: memberOrName
	"Open a text window on the given member"
	| member |
	member := self memberNamed: memberOrName.
	member ifNil: [ ^self errorNoSuchMember: memberOrName ].
	StringHolder new
		acceptContents: member contents;
		openLabel: member fileName.
	self installed: member.