as yet unclassified
openOn: aSound title: aString
	"EnvelopeEditorMorph openOn: (AbstractSound soundNamed: 'brass1') copy title: 'brass1'"
	(self basicNew initOnSound: aSound title: aString) openInWorld