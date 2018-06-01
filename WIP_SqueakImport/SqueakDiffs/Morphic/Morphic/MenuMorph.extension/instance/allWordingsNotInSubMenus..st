*Morphic-MorphicExtras-accessing
allWordingsNotInSubMenus: verbotenSubmenuContentsList
	"Answer a collection of the wordings of all items and subitems, but omit the stay-up item, and also any items in any submenu whose tag is in verbotenSubmenuContents"

	| aList |
	aList := OrderedCollection new.
	self items do: [:anItem | aList addAll: (anItem allWordingsNotInSubMenus: verbotenSubmenuContentsList)].
	^ aList