file directory
directoryNames
	| dirNames projectNames entries |
	"Return a collection of names for the subdirectories of this directory but filter out project directories."

	entries := self entries.
	dirNames := (entries select: [:entry | entry isDirectory])
		collect: [:entry | entry name].
	projectNames := Set new.
	entries do: [:entry | 
		(entry isDirectory not
			and: ['*.pr' match: entry name])
			ifTrue: [projectNames add: (entry name copyFrom: 1 to: entry name size - 3)]].
	^dirNames reject: [:each | projectNames includes: each]
