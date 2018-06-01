private
errorNotFound: anObject
	"anObject was not found in this collection, raise appropriate error."

	^(NotFound object: anObject) signal