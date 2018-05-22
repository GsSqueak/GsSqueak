(PackageInfo named: 'Files') preamble: '"Migrate stdio handles and files from StandardFileStream to FileStream. Turn off encoding and reuse the streams if they are in use in the image for backwards compatibility."
(StandardFileStream classPool at: #StdioHandles) ifNotNil: [ :handleArray |
	FileStream classPool at: #TheStdioHandles put: handleArray ].
(StandardFileStream instVarNamed: #stdioFiles) ifNotNil: [ :stdioFiles |
	FileStream classPool
		at: #StdioFiles put: stdioFiles;
		at: #EncodeAndDecodeStdioFiles put: false ].
Smalltalk
	removeFromStartUpList: StandardFileStream;
	removeFromShutDownList: StandardFileStream'!
