client services
extractMemberWithoutPath: aMemberOrName
	"Extract aMemberOrName to its own filename, but ignore any directory paths, using my directory instead."
	self extractMemberWithoutPath: aMemberOrName inDirectory: self directory.
