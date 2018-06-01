file in/out
compressFilesIn: tempDir to: localName in: localDirectory
	"Compress all the files in tempDir making up a zip file in localDirectory named localName"

	| archive archiveName entry fileNames |
	archive := ZipArchive new.
	fileNames := tempDir fileNames.
	(fileNames includes: 'manifest')
		ifTrue: [fileNames := #('manifest'), (fileNames copyWithout: 'manifest')].
	fileNames do:[:fn|
		archiveName := fn.
		entry := archive addFile: (tempDir fullNameFor: fn) as: archiveName.
		entry desiredCompressionMethod: (
			fn = 'manifest'
				ifTrue: [ZipArchive compressionLevelNone] 
				ifFalse: [ZipArchive compressionDeflated]).
	].
	archive writeToFileNamed: (localDirectory fullNameFor: localName).
	archive close.
	tempDir fileNames do:[:fn|
		tempDir deleteFileNamed: fn ifAbsent:[]].
	localDirectory deleteDirectory: tempDir localName.