user interaction
fontFromUser: priorFont allowKeyboard: aBoolean 
	"TTFileDescription fontFromUser"
	| _gsSqueakTemp_fontMenu _gsSqueakTemp_fontNames _gsSqueakTemp_builder _gsSqueakTemp_resultBlock _gsSqueakTemp_style _gsSqueakTemp_font _gsSqueakTemp_widget _gsSqueakTemp_result |
	_gsSqueakTemp_builder := ToolBuilder default.
	_gsSqueakTemp_fontNames := self allFontsAndFiles keys asArray sort.
	_gsSqueakTemp_fontMenu := _gsSqueakTemp_builder pluggableMenuSpec new.
	_gsSqueakTemp_fontMenu label: 'Non-portable fonts'.
	_gsSqueakTemp_resultBlock := [:value | _gsSqueakTemp_result := value].
	_gsSqueakTemp_fontNames
		do: [:fontName | 
			| active ptMenu item |
			active := priorFont familyName sameAs: fontName.
			ptMenu := _gsSqueakTemp_builder pluggableMenuSpec new.
			TTCFont pointSizes
				do: [:pt | 
					| label |
					label := pt printString , ' pt'.
					item := ptMenu
								add: label
								target: _gsSqueakTemp_resultBlock
								selector: #value:
								argumentList: {{fontName. pt}}.
					item
						checked: (active
								and: [pt = priorFont pointSize])].
			item := _gsSqueakTemp_fontMenu add: fontName action: nil.
			item subMenu: ptMenu.
			item checked: active].
	_gsSqueakTemp_widget := _gsSqueakTemp_builder open: _gsSqueakTemp_fontMenu.
	_gsSqueakTemp_builder runModal: _gsSqueakTemp_widget.
	_gsSqueakTemp_result
		ifNil: [^ nil].
	_gsSqueakTemp_style := (TextStyle named: _gsSqueakTemp_result first)
				ifNil: [self installFamilyNamed: _gsSqueakTemp_result first].
	_gsSqueakTemp_style
		ifNil: [^ self].
	_gsSqueakTemp_font := _gsSqueakTemp_style fonts
				detect: [:any | any pointSize = _gsSqueakTemp_result last]
				ifNone: [].
	^ _gsSqueakTemp_font