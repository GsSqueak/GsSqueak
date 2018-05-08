testing
testRunArrayScan
	| ra ra2 strm |
	ra := RunArray scanFrom: (ReadStream on: '(14 50 312)f1,f1b,f1LInteger +;i').
	strm := WriteStream on: ''.
	ra writeScanOn: strm.
	
	ra2 := RunArray scanFrom: strm readStream.
	self assert: ra equals: ra2
