copying
postCopy
	| penultimateLiteral |
	(penultimateLiteral := self penultimateLiteral) isMethodProperties ifTrue:
		[self penultimateLiteral: penultimateLiteral copy]