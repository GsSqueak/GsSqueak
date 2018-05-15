fileIn/Out
scanFrom: strm
	^self fontNumber: (Integer readFrom: strm ifFail: [0])