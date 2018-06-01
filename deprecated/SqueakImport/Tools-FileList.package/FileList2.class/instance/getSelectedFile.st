private
getSelectedFile
	"Answer a filestream on the selected file.  If it cannot be opened for read/write, try read-only before giving up; answer nil if unsuccessful"

	ok == true ifFalse: [^ nil].
	directory ifNil: [^ nil].
	fileName ifNil: [^ nil].
	^ (directory oldFileNamed: fileName) ifNil:
		[directory readOnlyFileNamed: fileName]