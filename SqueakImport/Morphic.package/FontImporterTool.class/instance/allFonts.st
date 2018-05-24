accessing
allFonts
	^ allFonts ifNil: [ | fonts |
		fonts := Dictionary new.
		Cursor wait showWhile: [
			TTFileDescription fontPathsDo:[:path |
				TTFileDescription fontFilesIn: path do:[:font| | fontDesc filename fname |
					filename := path, FileDirectory slash, font fileName.
					fname := self textForFamily: font familyName subfamily: nil.
					fontDesc := fonts 
						at: font familyName
						ifAbsentPut: (FontImporterFontDescription new fontname: fname; yourself).
					font subfamilyName
						ifNil: [fontDesc filename: filename]
						ifNotNil: [ |subfontDesc sname | 
							sname := self textForFamily: font familyName subfamily: font subfamilyName.
							subfontDesc := FontImporterFontDescription new fontname: sname; yourself.
							subfontDesc
								parent: fontDesc;
								filename: filename.
							fontDesc addChild: subfontDesc]]]].
		allFonts := fonts values sorted.
		allFonts do: [:fontDesc | fontDesc normalize].
		allFonts].

		