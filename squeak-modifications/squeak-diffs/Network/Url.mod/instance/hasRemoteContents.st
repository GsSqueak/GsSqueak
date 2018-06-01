classification
hasRemoteContents
	"Return true if the receiver describes some remotely accessible content.
	Typically, this should only return if we could retrieve the contents
	on an arbitrary place in the outside world using a standard browser.
	In other words: If you can get to it from the next Internet Cafe, 
	return true, else return false."
	^false