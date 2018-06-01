private
listForPatterns: anArray
	"Make the list be those file names which match the pattern."

	| sizePad newList |
	newList := Set new.
	anArray do: [ :pat | newList addAll: (self entriesMatching: pat) ].
	newList := newList asArray sort: self sortBlock.
	sizePad := (newList inject: 0 into: [:mx :entry | mx max: entry fileSize])
					asStringWithCommas size.
	newList := newList collect: [ :e | self fileNameFormattedFrom: e sizePad: sizePad ].

	volList size = 1 ifTrue:
		["Include known servers along with other desktop volumes" 
		^ newList  ,
			(ServerDirectory serverNames collect: [:n | '^' , n , self folderString])].
	^ newList