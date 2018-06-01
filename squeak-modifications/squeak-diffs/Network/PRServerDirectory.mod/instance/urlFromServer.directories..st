private
urlFromServer: serverString directories: aCollection 
	"private - builds an url for server/directories"
	| result |
	result := String new writeStream.
	""
	{serverString} , aCollection
		do: [:each | ""
			result
				nextPutAll: (each copyReplaceAll: ' ' with: '+')]
		separatedBy: [result nextPutAll: self slash].
	""
	^ result contents