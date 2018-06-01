font mapping
fontSampler
	"Produces a Postscript .eps file on disk, returns a Morph."
	"PostscriptCanvas fontSampler"
	"PostscriptCanvas fontSampler openInWorld"
	| morph file |
	morph := Morph new
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		wrapDirection: #leftToRight;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		color: Color white.
	TextStyle actualTextStyles keysAndValuesDo: [ :styleName :style |
		{ style fontArray first. style fontArray last } do: [ :baseFont | | info |
			0 to: 2 do: [ :i | | font string string2 textMorph row |
				font := baseFont emphasized: i.
				(i isZero or: [ font ~~ baseFont ]) ifTrue: [
					string := font fontNameWithPointSize.
					row := Morph new
						layoutPolicy: TableLayout new;
						listDirection: #topToBottom;
						hResizing: #shrinkWrap;
						vResizing: #shrinkWrap;
						cellSpacing: 20@0;
						color: Color white.
		
					textMorph := TextMorph new hResizing: #spaceFill; backgroundColor: Color white; beAllFont: font; contentsAsIs: string.
					row addMorphBack: (textMorph imageForm asMorph).

					info := self postscriptFontInfoForFont: font.
					string2 := String streamContents: [ :stream |
						stream nextPutAll: info first; space; print: (font pixelSize * info second) rounded.
					].
					textMorph := TextMorph new hResizing: #spaceFill; backgroundColor: Color white; beAllFont: font; contentsAsIs: string2.
					row addMorphBack: textMorph.
					
					morph addMorphBack: row.
				]
			]
		]
	].
	morph bounds: Project current world bounds.
	morph layoutChanged; fullBounds.
	file := (FileDirectory default newFileNamed: 'PSFontSampler.eps').
	Cursor wait showWhile: [ 
		file nextPutAll: (EPSCanvas morphAsPostscript: morph) ].
	^morph