copying
postCopy
	"Must copy the associations, or later store will affect both the
original and the copy"

	super postCopy.
	array := array collect: [ :association |
		association ifNotNil: [ association copy ] ]