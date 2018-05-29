accessing
directory
	"String of part of url that is the directory. Has slashes as separators"

	urlObject ifNotNil: [^ urlObject pathDirString].
	^ directory