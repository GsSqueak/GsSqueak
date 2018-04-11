*SqClasses-fileIn/Out
putClassCommentToCondensedChangesFile: aFileStream
	"Called when condensing changes.  If the receiver has a class comment, and if that class comment does not reside in the .sources file, then write it to the given filestream, with the resulting RemoteString being reachable from the source file #2.  Note that any existing backpointer into the .sources file is lost by this process -- a situation that maybe should be fixed someday."
	^self moveClassCommentTo: aFileStream fileIndex: 2
