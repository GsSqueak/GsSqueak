comparing
hash
	"Hash is reimplemented because = is implemented.
	The super implementation is used to avoid hashing the value
	which can be extremely expensive."
	^super hash
