private
updateFileList
	"Update my files list with file names in the current directory 
	that match the pattern.
	The pattern string may have embedded newlines or semicolons; these
	separate different patterns."
	| _gsSqueakTemp_patterns |
	_gsSqueakTemp_patterns := OrderedCollection new.
	Cursor wait
		showWhile: [(pattern
				findTokens: (String
						with: Character cr
						with: Character lf
						with: $;))
				do: [:each | (each includes: $*)
							| (each includes: $#)
						ifTrue: [_gsSqueakTemp_patterns add: each]
						ifFalse: [each isEmpty
								ifTrue: [_gsSqueakTemp_patterns add: '*']
								ifFalse: [_gsSqueakTemp_patterns add: '*' , each , '*']]].
			list := self listForPatterns: _gsSqueakTemp_patterns.
			listIndex := 0.
			volListIndex := volList size.
			fileName := nil.
			contents := ''.
			self changed: #volumeListIndex.
			self changed: #fileList.
			self updateButtonRow]