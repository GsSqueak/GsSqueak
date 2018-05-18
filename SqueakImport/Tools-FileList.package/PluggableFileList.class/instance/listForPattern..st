file list menu
listForPattern: pat
	"Make the list be those file names which match the pattern."
	| entries sizePad newList allFiles |
	entries := directory entries select: fileFilterBlock.
	sizePad := (entries inject: 0 into: [:mx :entry | mx max: entry fileSize])
					asStringWithCommas size - 1.

	newList := OrderedCollection new: entries size.

	allFiles := pat = '*'.
	entries do:
		[:entry | "<dirflag><name><creationTime><modificationTime><fileSize>"
		(allFiles or: [entry isDirectory or: [pat match: entry name]]) ifTrue:
			[newList add: entry]].
	newList := newList asArray sort: self sortBlock.
	newList := newList collect: [ :e | self fileNameFormattedFrom: e sizePad: sizePad ].

	volList size = 1 ifTrue:
		["Include known servers along with other desktop volumes" 
		^newList ,
			(ServerDirectory serverNames collect: [:n | '^' , n , self folderString])].
	newFiles := OrderedCollection new.
	^ newList