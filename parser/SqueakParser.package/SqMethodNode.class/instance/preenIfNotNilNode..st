converting-private
preenIfNotNilNode: messageNode 
	"Transform a (var := expr) ifNil: [...] ifNotNil: [...] where var is only used
	in the ifNotNil: block
	and convert it to expr ifNil: [...] ifNotNil: [:var| ...]. Deal both with the
	pretty-print case where
	the block already declares the variable and the decompile case where
	it does not."
	| variable |
	self
		assert: (messageNode isMessageNode
				and: [messageNode macroPrinter == #printIfNilNotNil:indent:
						and: [messageNode receiver receiver isAssignmentNode]]).
	variable := messageNode receiver receiver variable.
	self
		assert: (variable isTemp
				and: [variable isRemote not]).
	messageNode arguments last arguments isEmpty
		ifTrue: [messageNode arguments last arguments: {variable}]
		ifFalse: [self assert: messageNode arguments last arguments asArray = {variable}.
			variable := nil].
	messageNode receiver receiver: messageNode receiver receiver value.
	variable
		ifNil: [^ self].
	self
		nodesDo: [:node | ((node == self
						or: [node isBlockNode])
					and: [node temporaries includes: variable])
				ifTrue: [node
						temporaries: (node temporaries copyWithout: variable)]]