client services
fileInMonticelloZipVersionNamed: memberName 
	"This is to be used from preamble/postscript code to file in zip 
	members as Monticello version (.mcz) files."

	| member mczInstaller newCS mcMczReader |
	mcMczReader := Smalltalk at: #MCMczReader ifAbsent: [].
	mczInstaller := Smalltalk at: #MczInstaller ifAbsent: [].
	member := self memberNamed: memberName.
	member ifNil: [^self errorNoSuchMember: memberName].

	"If we don't have Monticello, but have the bootstrap, use it silently."
	mcMczReader ifNil:  [
		mczInstaller ifNotNil: [ ^mczInstaller installStream: member contentStream ].
		(self confirm: 'Monticello is not installed, but must be to load member named ', memberName , '.
Load it from SqueakMap?') 
			ifTrue:  [ self class loadMonticello.
						^self fileInMonticelloZipVersionNamed: memberName]
					ifFalse: [^false]].

	self class withCurrentChangeSetNamed: member localFileName
		do: 
			[:cs | 
			newCS := cs.
			(mcMczReader versionFromStream: member contentStream) load ].
	newCS isEmpty ifTrue: [ChangeSet removeChangeSet: newCS].
	Project current world doOneCycle.
	self installed: member