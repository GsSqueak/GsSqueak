examples
grabScreenAndSaveOnDisk
	"GIFReadWriter grabScreenAndSaveOnDisk"

	| form fileName |
	form := Form fromUser.
	form bits size = 0 ifTrue: [^Beeper beep].
	fileName := FileDirectory default nextNameFor: 'Squeak' extension: 'gif'.
	UIManager default informUser: 'Writing ' , fileName
		during: [GIFReadWriter putForm: form onFileNamed: fileName]