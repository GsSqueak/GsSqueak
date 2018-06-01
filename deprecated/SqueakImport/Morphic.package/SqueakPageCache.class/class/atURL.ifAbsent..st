cache access
atURL: aURLString ifAbsent: failBlock
	"Answer the page corresponding to this URL. Evaluate the given block if there is no entry for the given URL."

	self halt.  "use atURL:"
