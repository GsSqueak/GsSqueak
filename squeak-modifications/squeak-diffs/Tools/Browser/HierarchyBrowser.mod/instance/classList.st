class list
classList
	"each time we update the class list make sure to check that all the classes we think we should display are in fact in the environment"
	classDisplayList := classDisplayList select: [:each | (self environment valueOf: each withBlanksTrimmed asSymbol) notNil].
	^ classDisplayList