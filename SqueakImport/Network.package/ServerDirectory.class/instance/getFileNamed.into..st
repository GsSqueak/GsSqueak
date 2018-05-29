up/download
getFileNamed: fileNameOnServer into: dataStream
	
	^self getFileNamed: fileNameOnServer into: dataStream 
		httpRequest: 'Pragma: no-cache', String crlf