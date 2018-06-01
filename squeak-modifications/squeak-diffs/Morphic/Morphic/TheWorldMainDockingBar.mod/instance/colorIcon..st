private
colorIcon: aColor

	"Guess if 'uniform window colors' are used and avoid all icons to be just gray"
	(aColor = (UserInterfaceTheme current get: #uniformWindowColor for: Model) or: [Preferences tinyDisplay]) ifTrue: [ ^nil ].
	^(aColor iconOrThumbnailOfSize: 14)
		borderWidth: 3 color: ((UserInterfaceTheme current get: #color for: #MenuMorph) ifNil: [(Color r: 0.9 g: 0.9 b: 0.9)]) muchDarker;
		borderWidth: 2 color: Color transparent