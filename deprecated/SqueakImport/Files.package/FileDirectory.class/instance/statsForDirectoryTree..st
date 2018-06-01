enumeration
statsForDirectoryTree: rootedPathName
	"Return the size statistics for the entire directory tree starting at the given root. The result is a three element array of the form: (<number of folders><number of files><total bytes in all files>). This method also serves as an example of how recursively enumerate a directory tree."
	"FileDirectory default statsForDirectoryTree: '\smalltalk'"

	| dirs files bytes todo entries p |
	dirs := files := bytes := 0.
	todo := OrderedCollection with: rootedPathName.
	[todo isEmpty] whileFalse: [
		p := todo removeFirst.
		entries := self directoryContentsFor: p.
		entries do: [:entry |
			entry isDirectory
				ifTrue: [
					todo addLast: p , self pathNameDelimiter asString , entry name.
					dirs := dirs + 1]
				ifFalse: [
					files := files + 1.
					bytes := bytes + entry fileSize]]].
	^ Array with: dirs with: files with: bytes
