client services
fileInMonticelloVersionNamed: memberName 
	"This is to be used from preamble/postscript code to file in zip 
	members as Monticello version (.mcv) files."

	| member newCS mcMcvReader |
	mcMcvReader := Smalltalk at: #MCMcvReader ifAbsent: [].
	member := self memberNamed: memberName.
	member ifNil: [^self errorNoSuchMember: memberName].

	"If we don't have Monticello, offer to get it."
	mcMcvReader ifNil:  [
		(self confirm: 'Monticello is not installed, but must be to load member named ', memberName , '.
Load it from SqueakMap?') 
			ifTrue:  [ self class loadMonticello.
						^self fileInMonticelloVersionNamed: memberName]
					ifFalse: [^false]].

	self class withCurrentChangeSetNamed: member localFileName
		do: 
			[:cs | 
			newCS := cs.
			(mcMcvReader versionFromStream: member contentStream ascii) load ].
	newCS isEmpty ifTrue: [ChangeSet removeChangeSet: newCS].
	Project current world doOneCycle.
	self installed: member