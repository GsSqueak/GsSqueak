project window creation
openFromDirectory: aDirectory andFileName: aFileName
	
	Project canWeLoadAProjectNow ifFalse: [^ self].
	^ProjectLoading openFromDirectory: aDirectory andFileName: aFileName