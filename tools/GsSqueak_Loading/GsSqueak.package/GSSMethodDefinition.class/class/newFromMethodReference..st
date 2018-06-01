as yet unclassified
newFromMethodReference: aMethodReference

	^ self new
		category: aMethodReference category;
		selector: aMethodReference selector;
		source: aMethodReference sourceString withSqueakLineEndings