private
recentDirs
	"Put up a menu and let the user select from the list of recently visited directories."

	| dirName |
	RecentDirs isEmpty ifTrue: [^self].
	dirName := UIManager default chooseFrom: RecentDirs values: RecentDirs.
	dirName == nil ifTrue: [^self].
	self directory: (FileDirectory on: dirName)