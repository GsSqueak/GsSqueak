private
primLookupEntryIn: fullPath name: fName

	"Look up <fName> (a simple file name) in the directory identified by <fullPath>
 	 and return an array containing:

	<fName> <creationTime> <modificationTime> <dirFlag> <fileSize>

	On Unix, the empty path denotes '/'. 
      On Macs and PCs, it is the container of the system volumes.)

	The creation and modification times are in seconds since the start of the Smalltalk time epoch. DirFlag is true if the entry is a directory. FileSize the file size in bytes or zero for directories. The primitive returns nil when index is past the end of the directory. It fails if the given path is bad."

 	self halt.

	^ #primFailed		"to distinguish from nil"

