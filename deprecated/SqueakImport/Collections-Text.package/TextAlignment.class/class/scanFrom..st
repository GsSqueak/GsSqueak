fileIn/Out
scanFrom: strm
	^self new alignment: (Integer readFrom: strm ifFail: [0])