instance creation
forStone: stoneName inPath: devkitPath

	| topazProcess repository |
	topazProcess := TopazProcess forStone: stoneName inPath: devkitPath.
	repository := self new
					stoneName: stoneName;
					topazProcess: topazProcess.
	self addInstance: repository.
	^ repository