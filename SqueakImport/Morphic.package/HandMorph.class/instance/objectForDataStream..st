objects from disk
objectForDataStream: refStrm
	| dp |
	"I am about to be written on an object file.  Write a path to me in the other system instead."

	(refStrm project world hands includes: self) ifTrue: [
		^ self].	"owned by the project"
	dp := DiskProxy global: #World selector: #primaryHand args: #().
	refStrm replace: self with: dp.
	^ dp
	"Note, when this file is loaded in an MVC project, this will return nil.  The MenuItemMorph that has this in a field will have that item not work.  Maybe warn the user at load time?"