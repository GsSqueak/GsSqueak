volume list and pattern
listForPattern: pat 
	"Make the list be those file names which match the pattern."
	| _gsSqueakTemp_sizePad _gsSqueakTemp_newList |
	_gsSqueakTemp_newList := (self entriesMatching: pat) asArray sort: self sortBlock.
	_gsSqueakTemp_sizePad := (_gsSqueakTemp_newList
				inject: 0
				into: [:mx :entry | mx
						max: (entry at: 5)]) asStringWithCommas size - 1.
	_gsSqueakTemp_newList := _gsSqueakTemp_newList
				collect: [:e | self fileNameFormattedFrom: e sizePad: _gsSqueakTemp_sizePad].
	volList size = 1
		ifTrue: ["Include known servers along with other desktop volumes"
			^ _gsSqueakTemp_newList
				, (ServerDirectory serverNames
						collect: [:n | '^' , n , self folderString])].
	^ _gsSqueakTemp_newList