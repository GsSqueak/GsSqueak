file directory
rename: fullName toBe: newName
	"Rename a remote file.  fullName is just be a fileName, or can be directory path that includes name of the server.  newName is just a fileName"
	| file |

	file := self asServerFileNamed: fullName.
	file isTypeFile ifTrue: [
		(FileDirectory forFileName: (file fileNameRelativeTo: self)) 
			rename: file fileName toBe: newName
	].
	
	client := self openFTPClient.
	[client renameFileNamed: fullName to: newName]
		ensure: [self quit].
	