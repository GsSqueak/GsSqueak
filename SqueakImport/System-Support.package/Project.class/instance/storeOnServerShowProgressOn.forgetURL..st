file in/out
storeOnServerShowProgressOn: aMorphOrNil forgetURL: forget

	"Save to disk as an Export Segment.  Then put that file on the server I came from, as a new version.  Version is literal piece of file name.  Mime encoded and http encoded."

	world setProperty: #optimumExtentFromAuthor toValue: world extent.
	self validateProjectNameIfOK: [:details |
		self acceptProjectDetails: details.
		self isCurrentProject ifTrue: ["exit, then do the command"
			forget
				ifTrue: [self forgetExistingURL]
				ifFalse: [urlList isEmptyOrNil ifTrue: [urlList := parentProject urlList copy]].
			^self
				armsLengthCommand: #storeOnServerAssumingNameValid
				withDescription: 'Publishing' translated
		].
		self storeOnServerWithProgressInfoOn: aMorphOrNil.
	].
