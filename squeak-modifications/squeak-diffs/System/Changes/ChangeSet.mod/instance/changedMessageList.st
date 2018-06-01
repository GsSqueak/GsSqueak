method changes
changedMessageList
	"Used by a message set browser to access the list view information."

	| messageList |
	messageList := OrderedCollection new.
	changeRecords associationsDo: [:clAssoc | | classNameInParts classNameInFull |
		classNameInFull := clAssoc key asString.
		classNameInParts := classNameInFull findTokens: ' '.

		(clAssoc value allChangeTypes includes: #comment) ifTrue:
			[messageList add:
				(MethodReference new
					setClassSymbol: classNameInParts first asSymbol
					classIsMeta: false 
					methodSymbol: #Comment 
					stringVersion: classNameInFull, ' Comment')].

		clAssoc value methodChangeTypes associationsDo: [:mAssoc |
			(#(remove addedThenRemoved) includes: mAssoc value) ifFalse:
				[messageList add:
					(MethodReference new
						setClassSymbol: classNameInParts first asSymbol
						classIsMeta: classNameInParts size > 1 
						methodSymbol: mAssoc key 
						stringVersion: classNameInFull, ' ' , mAssoc key)]]].
	^ messageList sort