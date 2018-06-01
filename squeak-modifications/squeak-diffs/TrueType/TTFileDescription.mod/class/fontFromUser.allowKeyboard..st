user interaction
fontFromUser: priorFont allowKeyboard: aBoolean
	"TTFileDescription fontFromUser"
	| fontMenu fontNames builder resultBlock style font widget result |
	builder := ToolBuilder default.
	fontNames := self allFontsAndFiles keys asArray sort.
	fontMenu := builder pluggableMenuSpec new.
	fontMenu label: 'Non-portable fonts'.
	resultBlock := [:value| result := value].
	fontNames do: [:fontName | | active ptMenu item |
		active := priorFont familyName sameAs: fontName.
		ptMenu := builder pluggableMenuSpec new.
		TTCFont pointSizes do: [:pt | | label |
			label := pt printString, ' pt'.
			item := ptMenu add: label 
				target: resultBlock
				selector: #value:
				argumentList: {{fontName. pt}}.
			item checked: (active and:[pt = priorFont pointSize]).
		].
		item := fontMenu add: fontName action: nil.
		item subMenu: ptMenu.
		item checked: active.
	].
	widget := builder open: fontMenu.
	builder runModal: widget.
	result ifNil:[^nil].
	style := (TextStyle named: result first) ifNil:[self installFamilyNamed: result first].
	style ifNil: [^ self].
	font := style fonts detect: [:any | any pointSize = result last] ifNone: [nil].
	^ font
