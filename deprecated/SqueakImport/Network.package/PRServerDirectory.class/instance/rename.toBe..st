file directory
rename: fullName toBe: newName 
	"Rename a remote file. fullName is just be a fileName, or can 
	be directory path that includes name of the server. newName 
	is just a fileName"
	^ self inform: 'operation not supported' translated