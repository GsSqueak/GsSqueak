slots-kernel
categoriesForWorld
	"Answer the list of categories given that the receiver is the Player
	representing a World"
	| _gsSqueakTemp_aList |
	_gsSqueakTemp_aList := #(#'color & border' #geometry #'pen trails' #playfield #collections #'stack navigation' ) asOrderedCollection.
	_gsSqueakTemp_aList addFirst: ScriptingSystem nameForScriptsCategory.
	_gsSqueakTemp_aList addFirst: ScriptingSystem nameForInstanceVariablesCategory.
	_gsSqueakTemp_aList add: #input.
	Preferences eToyFriendly
		ifFalse: [_gsSqueakTemp_aList add: #preferences].
	^ _gsSqueakTemp_aList