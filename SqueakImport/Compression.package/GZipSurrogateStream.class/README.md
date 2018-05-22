A pseudo stream that allows SmartRefStream to write directly to a gzipped file. There are some peculiarities of the project exporting process that require:

1. We ignore #close since the file is closed and may be reopened to continue writing. We implement #reallyClose for when we know that all writing is over.

2. We use a BitBlt to write WordArrayForSegment objects. Bit of a hack, but there it is.

| fileStream wa |

wa := WordArrayForSegment new: 30000.
1 to: wa size do: [ :i | wa at: i put: i].
fileStream := GZipSurrogateStream newFileNamed: 'xxx3.gz' inDirectory: FileDirectory default.
fileStream nextPutAll: 'this is a test'.
fileStream nextPutAll: wa.
fileStream reallyClose.
