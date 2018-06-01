directory tree
rootDirectoryList
	| dirList dir servers |
	dir := FileDirectory on: ''.
	dirList := dir directoryNames collect:[:each| dir directoryNamed: each]..
	dirList isEmpty ifTrue:[dirList := Array with: FileDirectory default].
	servers := ServerDirectory serverNames collect: [ :n | ServerDirectory serverNamed: n].
	"This is so FileListPlus will work on ancient Squeak versions."
	servers := servers select:[:each| each respondsTo: #localName].
	^dirList, servers