instance creation
scanFrom: strm
	"Read the style section of a fileOut or sources file.  nextChunk has already been done.  We need to return a RunArray of TextAttributes of various kinds.  These are written by the implementors of writeScanOn:"
	| runs values attrList char |
	(strm peekFor: $( ) ifFalse: [^ nil].
	runs := OrderedCollection new.
	[strm skipSeparators.
	 strm peekFor: $)] whileFalse: 
		[runs add: (Number readFrom: strm)].
	values := OrderedCollection new.	"Value array"
	attrList := OrderedCollection new.	"Attributes list"
	[(char := strm peek) == nil] whileFalse: [
		(char isSeparator or: [ char = $! ])
			ifTrue: [ "n.b. Skip $! to meet expectations of RunArrayTest>>testScanFromTrailer.
					The example string used in that test does not seem to match the implemention
					of the fileOut serialization, but the test may be right and the implementation
					wrong. In any case, relax the parsing here to meet the test expectations, and to
					be more consistent with the original version of this method that assumed any
					unexpected charater to be a separator. -dtl Jan 2014"
				strm next "space, cr do nothing"]
			ifFalse: [char == $,
					ifTrue: [strm next.
						values add: attrList asArray.
						attrList reset ]
					ifFalse: [attrList add:  (TextAttribute newFrom: strm)]
				]
		].
	values add: attrList asArray.
	^ self runs: runs asArray values: (values copyFrom: 1 to: runs size) asArray
"
RunArray scanFrom: (ReadStream on: '(14 50 312)f1,f1b,f1LInteger +;i')
"