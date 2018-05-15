accessing
commentStamp

	^ commentStamp ifNil: [self realClass theNonMetaClass organization commentStamp ifNil: ['']]