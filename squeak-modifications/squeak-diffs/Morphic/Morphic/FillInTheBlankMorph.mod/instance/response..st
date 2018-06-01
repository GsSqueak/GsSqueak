accessing
response: aText
	"Sent when text pane accepts."

	result := aText asString.
	self delete.
