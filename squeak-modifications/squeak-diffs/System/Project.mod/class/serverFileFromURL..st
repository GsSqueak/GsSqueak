squeaklet on server
serverFileFromURL: aURLString

	| dir |
	self flag: #bob.		"need to include swikis in this - hacked for now"

	(aURLString findString: '/SuperSwikiProj/') > 0 ifTrue: [
		dir := SuperSwikiServer new fullPath: (aURLString copyUpToLast: $/).
		^dir readOnlyFileNamed: (aURLString findTokens: '/') last
	].
	^ServerFile new fullPath: aURLString