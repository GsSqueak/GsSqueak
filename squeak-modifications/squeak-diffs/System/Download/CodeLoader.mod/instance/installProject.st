installing
installProject
	"Assume that we're loading a single file and it's a project"
	| aStream |
	aStream := sourceFiles first contentStream.
	aStream ifNil:[^self error:'Project was not loaded'].
	ProjectLoading openOn: aStream