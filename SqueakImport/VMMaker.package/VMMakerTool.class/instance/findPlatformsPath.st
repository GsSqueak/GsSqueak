path access
findPlatformsPath
	| dir |
	dir := self selectDirectory.
	dir ifNil: [^nil].
	self platformsPathText: dir pathName