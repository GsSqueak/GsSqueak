accessing
noteResource: aResourceStub replacing: anObject
	"Remember the fact that we need to load aResource which will replace anObject."
	stubMap at: aResourceStub put: anObject.