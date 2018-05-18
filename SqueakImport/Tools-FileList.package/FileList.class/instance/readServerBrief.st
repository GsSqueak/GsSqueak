private
readServerBrief
	| lString sizeStr fsize ff first5000 parts |
	"If file on server is known to be long, just read the beginning.  Cheat badly by reading the fileList string."

	listIndex = 0 ifTrue: [^ self].
	"Get size from file list entry"
	lString := list at: listIndex.
	parts := lString findTokens: '()'.
	sortMode = #name ifTrue: [sizeStr := (parts second findTokens: ' ') third].
	sortMode = #date ifTrue: [sizeStr := (parts first findTokens: ' ') third].
	sortMode = #size ifTrue: [sizeStr := (parts first findTokens: ' ') first].
	fsize := (sizeStr copyWithout: $,) asNumber.

	fsize <= 50000 ifTrue:
		[ff := directory oldFileOrNoneNamed: self fullName.
		ff ifNil: [^ 'For some reason, this file cannot be read' translated].
		contents := ff contentsOfEntireFile.
		brevityState := #fullFile.   "don't change till actually read"
		^ contents].

	"if brevityFlag is true, don't display long files when first selected"
	first5000 := directory getOnly: 3500 from: fileName.
	contents := 'File ''{1}'' is {2} bytes long.
You may use the ''get'' command to read the entire file.

Here are the first 3500 characters...
------------------------------------------
{3}
------------------------------------------
... end of the first 3500 characters.' translated format: {fileName. sizeStr. first5000}.
	brevityState := #briefFile.   "don't change till actually read"
	^ contents.

