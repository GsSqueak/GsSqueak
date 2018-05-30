miscellaneous
identifyScript
	| msg aPlayer |
	msg := methodClass isUniClass
		ifTrue:
			[aPlayer := methodClass someInstance.
			aPlayer costume
				ifNotNil:
					['This holds code for a script
named ', methodSelector, ' belonging
to an object named ', aPlayer externalName]
				ifNil:
					['This formerly held code for a script
named ', methodSelector, ' for a Player
who once existed but now is moribund.']]
		ifFalse:
			['This holds code for the method
named ', methodSelector, '
for class ', methodClass name].
	self inform: msg