fileIn/Out
objectForDataStream: refStrm
	"I am about to be written on an object file.  Write a path to me in the other system instead."

	refStrm projectChangeSet == self ifTrue: [^ self].

	"try to write reference for me"
	^ DiskProxy 
		global: #ChangeSet
		selector: #existingOrNewChangeSetNamed: 
		args: (Array with: self name)
"===
	refStrm replace: self with: nil.
	^ nil
==="
