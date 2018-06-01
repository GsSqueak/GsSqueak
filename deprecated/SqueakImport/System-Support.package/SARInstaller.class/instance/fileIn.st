fileIn
fileIn
	"File in to a change set named like my file"
	directory readOnlyFileNamed: fileName do: [:stream |
		| newCS |
		newCS := self class withCurrentChangeSetNamed: fileName
			do: [:cs | self fileInFrom: stream].
		newCS isEmpty ifTrue: [ ChangeSet removeChangeSet: newCS ]]