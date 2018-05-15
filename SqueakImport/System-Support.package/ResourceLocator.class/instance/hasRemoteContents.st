testing
hasRemoteContents
	"Return true if we describe a resource which is non-local, e.g., on some remote server."
	(urlString indexOf: $:) = 0 ifTrue:[^false]. "no scheme"
	^urlString asUrl hasRemoteContents