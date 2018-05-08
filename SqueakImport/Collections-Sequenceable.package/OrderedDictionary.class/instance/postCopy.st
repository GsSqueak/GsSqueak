copying
postCopy
	"We must not copy associations again but retrieve them from the array, which is already a copy. See super."

	super postCopy.
	order := order copy.
	1 to: tally do: [ :index |
		order at: index put: (array at: (self scanFor: (order at: index) key)) ]