construction
buildMorphicCodePaneWith: editString
	"Construct the pane that shows the code.
	Respect the Preference for standardCodeFont."

	| codePane |
	codePane := PluggableTextMorph
				on: self
				text: #contents
				accept: #contents:notifying:
				readSelection: #contentsSelection
				menu: #codePaneMenu:shifted:.
	codePane font: Preferences standardCodeFont.
	editString
		ifNotNil: [codePane editString: editString.
			codePane hasUnacceptedEdits: true].
	^ codePane