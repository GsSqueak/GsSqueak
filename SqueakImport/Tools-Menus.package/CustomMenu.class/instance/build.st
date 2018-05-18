private
build
	"Turn myself into an invokable ActionMenu."

	| stream |
	stream := WriteStream on: (String new).
	labels do: [:label | stream nextPutAll: label; cr].
	(labels isEmpty) ifFalse: [stream skip: -1].  "remove final cr"
	super labels: stream contents
		font: MenuStyle defaultFont
		lines: dividers