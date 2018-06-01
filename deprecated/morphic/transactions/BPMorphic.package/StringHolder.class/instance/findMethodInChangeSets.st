-Tools
findMethodInChangeSets
	"Find and open a changeSet containing the current method."
	self selectedMessageName
		ifNotNil: [:_gsSqueakTemp_aName | ChangeSorter browseChangeSetsWithClass: self selectedClassOrMetaClass selector: _gsSqueakTemp_aName]