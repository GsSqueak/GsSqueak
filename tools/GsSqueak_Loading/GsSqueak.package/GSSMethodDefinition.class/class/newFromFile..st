as yet unclassified
newFromFile: aDirectoryEntry

	| lines contents source |
	contents := aDirectoryEntry readStream contents withSqueakLineEndings.
	lines := contents lines.
	source := contents allButFirst: lines first size + 1.
	^ self new
		category: lines first;
		selector: (Object parserClass new parseSelector: source);
		source: source.