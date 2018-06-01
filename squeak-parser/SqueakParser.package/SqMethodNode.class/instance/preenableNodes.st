converting-private
preenableNodes
	"Answer a Dictionary from node or sequence of nodes to preen method
	selector for nodes
	in the tree that require post-processing after either a format or a
	decompile. Such issues
	are the variable for an ifNotNil: which is local to the ifNotNil: block but,
	due to the inlining
	of ifNotNil: appears to be declared at the outer level, and, similarly, a
	temporary variable
	that conflicts with one of the same name in a block when, were the
	variable declared
	local to some inlined block it would no longer conflict. The resulting
	dictionary is used to
	perform the value with the key (node or array) as argument to preen
	the tree."
	| preenableNodes priorBlocks priorVariables |
	preenableNodes := Dictionary new.
	priorBlocks := OrderedCollection new.
	priorVariables := Set new.
	self
		nodesDo: [:node | 
			| variable temps |
			(node isMessageNode
					and: [node macroPrinter == #printIfNilNotNil:indent:
							and: [node receiver isMessageNode
									and: [node receiver selector key == #==
											and: [node receiver receiver isAssignmentNode
													and: [(variable := node receiver receiver variable) isTemp
															and: [variable isRemote not
																	and: [variable isOnlySubnodeOf: node in: self]]]]]]])
				ifTrue: [preenableNodes at: node put: #preenIfNotNilNode:.
					priorVariables add: variable].
			node isBlockNode
				ifTrue: [temps := OrderedCollection new.
					node temporaries
						do: [:temp | priorBlocks
								do: [:aBlock | aBlock temporaries
										do: [:priorTemp | (priorVariables includes: priorTemp)
												ifFalse: [priorTemp key = temp key
														ifTrue: [temps addLast: priorTemp]]]]].
					temps isEmpty
						ifFalse: [preenableNodes at: temps put: #preenTempsConflictingWithBlockNode:].
					priorBlocks addLast: node]].
	^ preenableNodes