as yet unclassified
fileNameRelativeTo: aServerDir
	"Produce an absolute fileName from me and an absolute directory"
	urlObject isAbsolute ifFalse: [
		(aServerDir urlObject ~~ nil and: [aServerDir urlObject isAbsolute]) 
			ifTrue: [urlObject 
				privateInitializeFromText: urlObject pathString 
				relativeTo: aServerDir urlObject]
			ifFalse: [urlObject default]].	"relative to Squeak directory"
	^ urlObject pathForDirectory, self fileName