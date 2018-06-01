testing
renameInternal: aName 
	"Change the internal name (because of a conflict) but leave the external name unchanged.  Change Player class name, but do not change the names that appear in tiles.  When coming in from disk, and have name conflict, References will already have the new name. "

	self knownName = aName ifTrue: [^ aName].
	self topRendererOrSelf setNameTo: aName.
	
	"References dictionary already has key aName"

	"If this player has a viewer flap, it will remain present"

	"Tiles in scripts all stay the same"

	"Compiled methods for scripts have been fixed up because the same association was reused"
	
	^ aName