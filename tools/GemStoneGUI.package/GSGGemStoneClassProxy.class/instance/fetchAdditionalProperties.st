additional properties
fetchAdditionalProperties

	| query result propertyDict |
	query := '| class instanceSide classSide |
				class := {1}.
				instanceSide := class thisClass.
				classSide := class isMeta ifTrue: [class] ifFalse: [class class].
				\{
					(instanceSide superclassForEnv: {2})
						ifNil: [#nil]
						ifNotNil: [:cls | cls name].
					instanceSide category asSymbol.
					instanceSide isBytes
						ifTrue: [
							| wordSize type |
							wordSize := instanceSide _bytesPerWord.
							wordSize = 1 ifTrue: [type := #bytes].
							wordSize = 2 ifTrue: [type := #shorts].
							wordSize = 4 ifTrue: [type := #words].
							wordSize = 8 ifTrue: [type := #longs].
							type]
						ifFalse: [
							instanceSide isSpecial
								ifTrue: [#immedaite]
								ifFalse: [
									instanceSide isIndexable
										ifTrue: [#variable]
										ifFalse: [#normal]]].
					instanceSide comment ifNil: [''''].
					instanceSide commentStamp ifNil: [''''].
					instanceSide instVarNames.
					instanceSide classVarNames.
					classSide instVarNames.
					instanceSide sharedPools collect: [:symbolDict | symbolDict name].
					instanceSide _optionsArray\}'
						format: {
							self codeReferencingMe.
							self environmentId}.
	result := self repository
				fetch: #Array -> {#Symbol . #Symbol . #Symbol . #String . #String . #Array -> #(Symbol)}
				query: query.
	propertyDict := Dictionary new.
	#(superclassName
	category
	typeOfClass
	commentString
	commentStamp
	instVarNames
	classVarNames
	classInstVarNames
	poolDictionaryNames
	options) with: result do: [:key :value |
		propertyDict at: key put: value].
	^ propertyDict