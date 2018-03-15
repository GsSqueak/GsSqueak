instance creation
forStone: stoneName inPath: devkitPath

	| topazProcess |
	topazProcess := TopazProcess forStone: stoneName inPath: devkitPath.
	^ self new topazProcess: topazProcess