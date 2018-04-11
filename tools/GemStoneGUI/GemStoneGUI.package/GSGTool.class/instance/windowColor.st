accessing
windowColor
	
	| index |
	index := self session id.
	index even ifTrue: [ index := self colorWheel size / 2 + index].
	
	^ self colorWheel at: index \\ self colorWheel size + 1
