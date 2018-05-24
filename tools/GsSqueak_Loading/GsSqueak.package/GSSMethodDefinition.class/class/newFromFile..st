as yet unclassified
newFromFile: aDirectoryEntry

	| lines contents |
	contents := aDirectoryEntry readStream contents withSqueakLineEndings.
	lines := contents lines.
	^ self new
		category: lines first;
		selector: (Object parserClass new parseSelector: lines second);
		source: (contents allButFirst: lines first size + 1).