private
getFullProjectContents: aString 
	"private - get the project content from the server"
	^ self getOnly: nil ofProjectContents: aString