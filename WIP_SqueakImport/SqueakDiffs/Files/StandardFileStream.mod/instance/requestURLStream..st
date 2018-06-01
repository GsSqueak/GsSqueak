browser requests
requestURLStream: url
	"FileStream requestURLStream:'http://www.squeak.org'"
	^self requestURLStream: url ifError:[nil]