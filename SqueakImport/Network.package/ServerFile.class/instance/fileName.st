as yet unclassified
fileName
	"should this be local or as in a url?"

	urlObject ifNotNil: [^ urlObject path last].	"path last encodeForHTTP ?"
	^ fileName