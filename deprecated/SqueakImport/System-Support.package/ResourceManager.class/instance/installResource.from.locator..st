loading
installResource: aResource from: aStream locator: loc
	| repl |
	aResource ifNil:[^false]. "it went away, so somebody might have deleted it"
	(aStream == nil or:[aStream size = 0]) ifTrue:[^false]. "error?!"
	repl := aResource shallowCopy readResourceFrom: aStream asUnZippedStream.
	repl ifNotNil:[
		aResource replaceByResource: repl.
		unloaded remove: loc.
		loaded add: loc.
		^true
	].
	^false