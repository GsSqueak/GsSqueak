private
listForPatterns: anArray 
	"Make the list be those file names which match the pattern."
	| _gsSqueakTemp_sizePad _gsSqueakTemp_newList |
	_gsSqueakTemp_newList := Set new.
	anArray
		do: [:pat | _gsSqueakTemp_newList
				addAll: (self entriesMatching: pat)].
	_gsSqueakTemp_newList := _gsSqueakTemp_newList asArray sort: self sortBlock.
	_gsSqueakTemp_sizePad := (_gsSqueakTemp_newList
				inject: 0
				into: [:mx :entry | mx max: entry fileSize]) asStringWithCommas size.
	_gsSqueakTemp_newList := _gsSqueakTemp_newList
				collect: [:e | self fileNameFormattedFrom: e sizePad: _gsSqueakTemp_sizePad].
	volList size = 1
		ifTrue: ["Include known servers along with other desktop volumes"
			^ _gsSqueakTemp_newList
				, (ServerDirectory serverNames
						collect: [:n | '^' , n , self folderString])].
	^ _gsSqueakTemp_newList