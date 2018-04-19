*SqCollectionLiterals-*SqCollectionLiterals-initialize-release
compactAllInstances
	"Do not use #allInstancesDo: because #compact may create new instances."

	self allInstances do: [ :each | each compact ]
