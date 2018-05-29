accessing
descent
	"One is added to make sure the gap between lines is filled.  If we don't add, multi line selection in a text pane look ugly."
	^descent ifNil:[descent := self height - self ascent].
