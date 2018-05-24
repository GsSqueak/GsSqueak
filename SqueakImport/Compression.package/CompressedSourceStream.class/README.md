I implement a file format that compresses segment by segment to allow incremental writing and browsing.  Note that the file can only be written at the end.

Structure:
segmentFile		The actual compressed file.
segmentSize		This is the quantum of compression.  The virtual file is sliced up
				into segments of this size.
nSegments		The maximum number of segments to which this file can be grown.
endOfFile		The user's endOfFile pointer.
segmentTable	When a file is open, this table holds the physical file positions
				of the compressed segments.
segmentIndex	Index of the most recently accessed segment.

Inherited from ReadWriteStream...
collection		The segment buffer, uncompressed
position			This is the position *local* to the current segment buffer
readLimit		ReadLimit for the current buffer
writeLimit		WriteLimit for the current buffer

Great care must be exercised to distinguish between the position relative to the segment buffer and the full file position (and, or course, the segment file position ;-).

The implementation defaults to a buffer size of 20k, and a max file size of 34MB (conveniently chosen to be greater than the current 33MB limit of source code pointers).  The format of the file is as follows:
	segmentSize		4 bytes
	nSegments		4 bytes
	endOfFile		4 bytes
	segmentTable	4 bytes * (nSegments+1)
	beginning of first compressed segment

It is possible to override the default allocation by sending the message #segmentSize:nSegments: immediately after opening a new file for writing, as follows:

	bigFile := (CompressedSourceStream on: (FileStream newFileNamed: 'biggy.stc'))
			segmentSize: 50000 maxSize: 200000000

The difference between segment table entries reveals the size of each compressed segment.  When a file is being written, it may lack the final segment, but any flush, position:, or close will force a dirty segment to be written.