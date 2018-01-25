accessing comment
classCommentBlank

	^String streamContents:
		[:stream|
		 stream
			nextPutAll: 'A';
			nextPutAll: (self name first isVowel ifTrue: ['n '] ifFalse: [' ']);
			nextPutAll: self name;
			nextPutAll: ' is xxxxxxxxx.';
			cr; cr;
			nextPutAll: 'Instance Variables'.

		 self instVarNames asSortedCollection do: [:each |
			stream
				crtab; nextPutAll: each;
				nextPut: $:;
				tab: 2;
				nextPutAll: '<Object>'].
		  stream cr.
		  self instVarNames asSortedCollection do: [:each |
			stream
				cr; nextPutAll: each;
				crtab; nextPutAll: '- xxxxx'; cr]]