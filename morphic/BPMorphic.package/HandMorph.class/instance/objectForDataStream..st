objects from disk
objectForDataStream: refStrm 
	"I am about to be written on an object file. Write a path to me in the
	other system instead."
	| _gsSqueakTemp_dp |
	(refStrm project world hands includes: self)
		ifTrue: [^ self].
	"owned by the project"
	_gsSqueakTemp_dp := DiskProxy
				global: #World
				selector: #primaryHand
				args: #().
	refStrm replace: self with: _gsSqueakTemp_dp.
	^ _gsSqueakTemp_dp"Note, when this file is loaded in an MVC project, this will return nil. The
	MenuItemMorph that has this in a field will have that item not work.
	Maybe warn the user at load time?"