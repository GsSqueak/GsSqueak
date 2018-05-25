*System-Object Storage-file in/out
objectForDataStream: refStrm
	| dp |
	"I am about to be written on an object file.  If I am one of two shared global arrays, write a proxy instead."

self == (TextConstants at: #DefaultTabsArray) ifTrue: [
	dp := DiskProxy global: #TextConstants selector: #at: args: #(DefaultTabsArray).
	refStrm replace: self with: dp.
	^ dp].
self == (TextConstants at: #DefaultMarginTabsArray) ifTrue: [
	dp := DiskProxy global: #TextConstants selector: #at: args: #(DefaultMarginTabsArray).
	refStrm replace: self with: dp.
	^ dp].
^ super objectForDataStream: refStrm