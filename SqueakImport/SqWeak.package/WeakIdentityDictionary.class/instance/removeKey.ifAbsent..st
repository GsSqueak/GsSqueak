removing
removeKey: key ifAbsent: aBlock 
	"Remove key (and its associated value) from the receiver. If key is not in 
	the receiver, answer the result of evaluating aBlock. Otherwise, answer 
	the value externally named by key."

	| index association |
	index := self scanFor: key.
	(association := (array at: index)) == vacuum ifTrue: [ ^aBlock value ].
	self cleanupIndex: index.
	^association value