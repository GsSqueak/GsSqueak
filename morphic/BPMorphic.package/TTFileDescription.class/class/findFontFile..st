font paths
findFontFile: fontFileName 
	"Find the path containing the font with the given name.
	If it can't be found, return nil."
	self
		fontPathsDo: [:path | 
			| fd |
			fd := FileDirectory on: path.
			([fd fileExists: fontFileName]
					on: Error
					do: [false])
				ifTrue: [^ fd fullNameFor: fontFileName]].
	^ nil