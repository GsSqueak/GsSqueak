comparing
hash
	"#hash is implemented, because #= is implemented"
	"ar 4/10/2005: I had to change this to use ByteString hash as initial 
	hash in order to avoid having to rehash everything and yet compute
	the same hash for ByteString and WideString.
	md 16/10/2006: use identityHash as initialHash, as behavior hash will 
	use String hash (name) to have a better hash soon.
	eem 4/17/2017 it's not possible to use String hash (name) for the
	initial hash because that would be recursive."
	^self class stringHash: self initialHash: ByteString identityHash
