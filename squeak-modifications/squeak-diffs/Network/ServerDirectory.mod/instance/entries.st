file directory
entries 
	"Return a collection of directory entries for the files and directories in this directory. Each entry is a five-element array: (<name> <creationTime> <modificationTime> <dirFlag> <fileSize>)."
	| dir ftpEntries |
	"We start with ftp directory entries of the form...
d---------   1 owner    group               0 Apr 27 22:01 blasttest
----------   1 owner    group           93812 Jul 21  1997 COMMAND.COM
    1        2   3           4                 5    6  7    8       9   -- token index"
	self isTypeFile ifTrue: [
		urlObject isAbsolute ifFalse: [urlObject default].
		^ (FileDirectory on: urlObject pathForDirectory) entries
	].

	dir := self getDirectory.
	(dir respondsTo: #contentsOfEntireFile) ifFalse: [^ #()].
	ftpEntries := dir contentsOfEntireFile findTokens: String crlf.
"ftpEntries inspect."
	^ ftpEntries 
		collect:[:ftpEntry | self class parseFTPEntry: ftpEntry]
		thenSelect: [:entry | entry notNil]