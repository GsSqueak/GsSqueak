initialization
class: clsName category: cat method: method sourceFiles: fileArray
	"This should be enough to find all the information for a method, or method deletion"

	file := fileArray at: method fileIndex.
	position := method filePosition.
	type := #method.
	class := clsName copyUpTo: $ .	"the non-meta part of a class name"
	category := cat.
	meta := clsName endsWith: ' class'.
	self readStamp.