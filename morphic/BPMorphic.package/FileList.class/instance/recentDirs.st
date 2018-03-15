private
recentDirs
	"Put up a menu and let the user select from the list of recently visited
	directories. "
	| _gsSqueakTemp_dirName |
	RecentDirs isEmpty
		ifTrue: [^ self].
	_gsSqueakTemp_dirName := UIManager default chooseFrom: RecentDirs values: RecentDirs.
	_gsSqueakTemp_dirName == nil
		ifTrue: [^ self].
	self
		directory: (FileDirectory on: _gsSqueakTemp_dirName)