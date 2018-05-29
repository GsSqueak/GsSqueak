file directory
pathParts
	"Return the path from the root of the file system to this  
	directory as an array of directory names. On a remote server."
	^ (OrderedCollection with: self server) addAll: self directories;
		 yourself