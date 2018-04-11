scripts
tilesFrom: aString 
	"Construct SyntaxMorph tiles for the String."
	"This is really cheating! Make a true parse tree later. -tk"
	| _gsSqueakTemp_code _gsSqueakTemp_tree _gsSqueakTemp_syn _gsSqueakTemp_block _gsSqueakTemp_phrase |
	_gsSqueakTemp_code := String
				streamContents: [:strm | 
					strm nextPutAll: 'doIt';
						 cr;
						 tab.
					strm nextPutAll: aString].
	"decompile to tiles"
	_gsSqueakTemp_tree := Compiler new
				parse: _gsSqueakTemp_code
				in: self
				notifying: nil.
	_gsSqueakTemp_syn := _gsSqueakTemp_tree asMorphicSyntaxUsing: SyntaxMorph.
	_gsSqueakTemp_block := _gsSqueakTemp_syn submorphs
				detect: [:mm | (mm respondsTo: #parseNode)
						and: [mm parseNode class == BlockNode]].
	_gsSqueakTemp_phrase := _gsSqueakTemp_block submorphs
				detect: [:mm | (mm respondsTo: #parseNode)
						and: [mm parseNode class == MessageNode]].
	^ _gsSqueakTemp_phrase