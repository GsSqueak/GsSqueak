code pane
pcRange
	"Answer the indices in the source code for the method corresponding to 
	the selected context's program counter value."

	| ctxt |
	(selectingPC and: [contextStackIndex ~= 0]) ifFalse:
		[^1 to: 0].
	(ctxt := self selectedContext) isDead ifTrue:
		[^1 to: 0].
	^ctxt debuggerMap
		rangeForPC: ctxt pc
		in: ctxt method
		contextIsActiveContext: contextStackIndex = 1