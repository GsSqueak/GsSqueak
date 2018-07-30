instance creation
forStone: stoneName inPath: devkitPath

	| topazProcess |
	topazProcess := GSGTopazProcess forStone: stoneName inPath: devkitPath.
	^ self new
		stoneName: stoneName;
		topazProcess: topazProcess