attributes
changeStyle
	"Let user change styles for the current text pane."
	| names reply style current menuList |

	current := paragraph textStyle.
	names := TextStyle knownTextStyles.
	menuList := names collect: [ :styleName |
		styleName = current name
			ifTrue: [ '<on>', styleName ]
			ifFalse: [ '<off>', styleName ]].
	reply := UIManager default chooseFrom: menuList values: names.
	reply ifNotNil: [
		(style := TextStyle named: reply) ifNil: [Beeper beep. ^ true].
		paragraph textStyle: style.
		paragraph composeAll.
		self recomputeSelection].
	^ true