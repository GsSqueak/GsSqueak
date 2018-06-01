downloading
downloadUrl
	"Returns a http download url for the location defined by this url."
	| ans |
	ans := WriteStream on: String new.
	ans nextPutAll: self schemeName.
	ans nextPutAll: '://'.
	ans nextPutAll: self authority.
	port ifNotNil: [ans nextPut: $:; print: port].
	path do: [ :pathElem |
		ans nextPut: $/.
		ans nextPutAll: pathElem encodeForHTTP. ].
	self query isNil ifFalse: [ 
		ans nextPut: $?.
		ans nextPutAll: self query. ].
	self fragment isNil ifFalse: [
		ans nextPut: $#.
		ans nextPutAll: self fragment encodeForHTTP. ].
	
	^ans contents