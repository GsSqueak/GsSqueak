accessing
wrapFlag: aBoolean 
	"Whether contained text will adjust its bounds as I change shape:
	|	wrapFlag |		TextMorph grows			|		TextMorph shrinks |
	|		true | wrapped lines fill new space	|	long lines wrap to fit |
	|		false | wrapped lines stay same |	long lines are cut off |"
	aBoolean == wrapFlag
		ifTrue: [^ self].
	wrapFlag := aBoolean.
	self composeToBounds