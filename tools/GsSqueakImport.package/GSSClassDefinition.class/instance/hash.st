comparing
hash

	^ (self name hash bitXor: self superclass hash)
		bitXor: (self type hash bitXor: self category hash)