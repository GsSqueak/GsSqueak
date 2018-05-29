housekeeping
compressSources	
	"Copy all the source file to a compressed file. Usually preceded by Smalltalk condenseSources."
	"The new file will be created in the default directory, and the code in openSources
	will try to open it if it is there, otherwise it will look for normal sources."
	"Smalltalk compressSources"

	| f cfName cf |
	f := SourceFiles first readOnlyCopy binary.	"binary to preserve utf8 encoding"
	(f localName endsWith: 'sources')
		ifTrue: [cfName := (f localName allButLast: 7) , 'stc']
		ifFalse: [self error: 'Hey, I thought the sources name ended with ''.sources''.'].
	cf := (CompressedSourceStream on: (FileStream newFileNamed: cfName))
				segmentSize: 65536 maxSize: f size.

	"Copy the sources"
'Compressing Sources File...'
	displayProgressFrom: 0 to: f size
	during:
		[:bar | f position: 0.
		[f atEnd] whileFalse:
			[cf nextPutAll: (f next: 65536).
			bar value: f position]].
	cf close.
	self setMacFileInfoOn: cfName.
	self inform: 'You now have a compressed sources file!
Squeak will use it the next time you start.'
