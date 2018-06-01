private
getProjectThumbnail: aProject 
	"private - answer a stream with the aProject's thumbnail or nil if none"
	| form stream |
	form := aProject thumbnail.
	form isNil
		ifTrue: [^ nil].
	""
	form unhibernate.
	form := form colorReduced.
	""
	self flag: #todo.
	"use a better image format than GIF"
	stream := ByteArray new writeStream.
	GIFReadWriter putForm: form onStream: stream.
	""
	^ stream contents asString