*Morphic-MorphicExtras-accessing
allWordings
	"Answer a collection of the wordings of all items and subitems, omitting the window-list in the embed... branch and (unless a certain hard-coded preference is set) also omitting items from the debug menu"

	| verboten |
	verboten := OrderedCollection with: 'embed into'.
	Preferences debugMenuItemsInvokableFromScripts 
		ifFalse:	[verboten add: 'debug...' translated].
	^ self allWordingsNotInSubMenus: verboten