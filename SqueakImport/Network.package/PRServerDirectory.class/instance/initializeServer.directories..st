initialization
initializeServer: serverString directories: directoriesCollection 
	"initialize the receiver's server and directories"
	server := serverString withBlanksTrimmed.
	server last = self pathNameDelimiter
		ifTrue: [server := server allButLast withBlanksTrimmed].
	""
	directories := directoriesCollection