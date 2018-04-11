directory tree
rootDirectoryList
	| _gsSqueakTemp_dirList _gsSqueakTemp_dir _gsSqueakTemp_servers |
	_gsSqueakTemp_dir := FileDirectory on: ''.
	_gsSqueakTemp_dirList := _gsSqueakTemp_dir directoryNames
				collect: [:each | _gsSqueakTemp_dir directoryNamed: each].
	_gsSqueakTemp_dirList isEmpty
		ifTrue: [_gsSqueakTemp_dirList := Array with: FileDirectory default].
	_gsSqueakTemp_servers := ServerDirectory serverNames
				collect: [:n | ServerDirectory serverNamed: n].
	"This is so FileListPlus will work on ancient Squeak versions."
	_gsSqueakTemp_servers := _gsSqueakTemp_servers
				select: [:each | each respondsTo: #localName].
	^ _gsSqueakTemp_dirList , _gsSqueakTemp_servers