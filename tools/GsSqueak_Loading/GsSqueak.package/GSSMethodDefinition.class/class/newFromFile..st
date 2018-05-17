as yet unclassified
newFromFile: aDirectoryEntry

	| lines contents |
	contents := aDirectoryEntry readStream contents.
	lines := contents lines.
	^ self new
		category: lines first;
		selector: lines second findSelector;
		source: (contents allButFirst: lines first size + 1).