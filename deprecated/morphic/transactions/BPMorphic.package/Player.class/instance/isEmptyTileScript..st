scripts-kernel
isEmptyTileScript: aScriptName 
	"Answer whether the script of the given name is an empty classic tile
	script. Presently disused -- formerly it was all too easy to propagate
	many empty tile scripts but this difficulty has receded considerably
	with recent changes, so this has no senders other than from an
	unusual menu item, and will perhaps die soon"
	| _gsSqueakTemp_aUserScript |
	Preferences universalTiles
		ifTrue: [^ false].
	_gsSqueakTemp_aUserScript := self class userScriptForPlayer: self selector: aScriptName.
	^ (_gsSqueakTemp_aUserScript instantiatedScriptEditorForPlayer: self) isEmpty