font paths
allFontsDo: aBlock 
	"Evaluate aBlock with all the fonts we can find. Use sparingly."
	self
		fontPathsDo: [:path | self
				fontFilesIn: path
				do: [:font | font familyName
						ifNotNil: [aBlock value: font]]]