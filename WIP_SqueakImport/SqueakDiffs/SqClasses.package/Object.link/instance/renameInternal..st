testing
renameInternal: newName 
	"Change the internal name (because of a conflict) but leave the external name unchanged.  Change Player class name, but do not change the names that appear in tiles.  Any object that might be pointed to in the References dictionary might get this message sent to it upon reload"

	^ nil	"caller will renameTo:.  new name may be different"
