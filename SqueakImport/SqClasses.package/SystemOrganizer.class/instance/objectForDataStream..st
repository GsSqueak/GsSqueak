fileIn/Out
objectForDataStream: refStrm
	| dp |
	"I am about to be written on an object file.  Write a path to me in the other system instead."

self == SystemOrganization ifTrue: [
	dp := DiskProxy global: #SystemOrganization selector: #yourself args: #().
	refStrm replace: self with: dp.
	^ dp].
^ self
