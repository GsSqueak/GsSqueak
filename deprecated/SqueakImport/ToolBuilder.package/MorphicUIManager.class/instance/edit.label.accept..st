ui requests
edit: aText label: labelString accept: anAction
	"Open an editor on the given string/text"
	| window |
	window := Workspace open.
	labelString ifNotNil: [ window setLabel: labelString ].
	"By default, don't style in UIManager edit: requests"
	window model
		shouldStyle: false;
		acceptContents:  aText;
		acceptAction: anAction.
	^window.