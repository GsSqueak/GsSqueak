accessing
printStat: time count: n string: aString
	Transcript
		cr;
		print: time; tab;
		nextPutAll:' mSecs -- ';
		print: n; tab;
		nextPutAll:' ops -- ';
		nextPutAll: ((time asFloat / (n max: 1) asFloat) printShowingMaxDecimalPlaces: 2); tab;
		nextPutAll: ' avg. mSecs/op -- ';
		nextPutAll: aString.