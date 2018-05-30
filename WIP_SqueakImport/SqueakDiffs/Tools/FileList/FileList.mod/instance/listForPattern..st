volume list and pattern
listForPattern: pat
	"Make the list be those file names which match the pattern."

	| sizePad newList |
	newList := (self entriesMatching: pat) asArray sort: self sortBlock.
	sizePad := (newList inject: 0 into: [:mx :entry | mx max: (entry at: 5)])
					asStringWithCommas size - 1.
	newList := newList collect: [ :e | self fileNameFormattedFrom: e sizePad: sizePad ].

	volList size = 1 ifTrue:
		["Include known servers along with other desktop volumes" 
		^ newList ,
		(ServerDirectory serverNames collect: [:n | '^' , n , self folderString])].
	^ newList