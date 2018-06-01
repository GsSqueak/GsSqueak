file in/out
storeOnServerAssumingNameValid

	"Save to disk as an Export Segment.  Then put that file on the server I came from, as a new version.  Version is literal piece of file name.  Mime encoded and http encoded."

	world setProperty: #optimumExtentFromAuthor toValue: world extent.
	self isCurrentProject ifTrue: ["exit, then do the command"
		^ self 
			armsLengthCommand: #storeOnServerAssumingNameValid
			withDescription: 'Publishing' translated
	].
	self storeOnServerWithProgressInfo.
