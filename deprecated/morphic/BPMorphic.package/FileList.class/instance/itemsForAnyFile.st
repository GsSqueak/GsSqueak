file list menu
itemsForAnyFile
	"Answer a list of universal services that could apply to any file"
	| _gsSqueakTemp_services |
	_gsSqueakTemp_services := OrderedCollection new: 4.
	_gsSqueakTemp_services add: self serviceCopyName.
	_gsSqueakTemp_services add: self serviceRenameFile.
	_gsSqueakTemp_services add: self serviceDeleteFile.
	_gsSqueakTemp_services add: self serviceViewContentsInWorkspace.
	^ _gsSqueakTemp_services