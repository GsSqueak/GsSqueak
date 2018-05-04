image save/restore
rewriteImageFileNamed: fileName
	"Write an image file on a file named fileName using the window size that
	was provided by the original image file. This is intended for rewriting an
	image file that has been read from a disk file, but that has not yet been
	run in the interpreter. This may be used to load an image file that had been
	saved by another type of interpreter, and resaving it in the format used by
	this interpreter. For example, an image that has been saved as format 6505
	(indicating use of native float word ordering for a Cog VM) may be resaved
	in format 6504."

	"(InterpreterSimulator new openOn: Smalltalk imageName) rewriteImageFileNamed: 'newimagefile.image' "

	| file numberOfBytesToWrite |
	bytesPerWord = 4 ifFalse: [self error: 'Not rewritten for 64 bits yet'].
	numberOfBytesToWrite := objectMemory getFreeBlock - objectMemory startOfMemory.

	[
		file := (FileStream fileNamed: fileName) binary.
		file == nil ifTrue: [^nil].
		Utilities informUser: 'Writing image to ''', fileName, '''...'
				during: [self writeImageFile: file size: numberOfBytesToWrite screenSize: savedWindowSize]
	]
		ensure: [file close]