reading
read
	| xTable strikeWidth glyphs ascent descent minAscii maxAscii maxWidth chars charsNum height form encoding bbx array width blt lastAscii pointSize ret stream |
	form := encoding := bbx := nil.
	self readAttributes.
	height := Integer readFromString: ((properties at: #FONTBOUNDINGBOX) at: 2).
	ascent := Integer readFromString: (properties at: #'FONT_ASCENT') first.
	descent := Integer readFromString: (properties at: #'FONT_DESCENT') first.
	pointSize := (Integer readFromString: (properties at: #'POINT_SIZE') first) // 10.
	
	maxWidth := 0.
	minAscii := 9999.
	strikeWidth := 0.
	maxAscii := 0.

	charsNum := Integer readFromString: (properties at: #CHARS) first.
	chars := Set new: charsNum.

	1 to: charsNum do: [:i |
		array := self readOneCharacter.
		stream := ReadStream on: array.
		form := stream next.
		encoding := stream next.
		bbx := stream next.
		form ifNotNil: [
			width := bbx at: 1.
			maxWidth := maxWidth max: width.
			minAscii := minAscii min: encoding.
			maxAscii := maxAscii max: encoding.
			strikeWidth := strikeWidth + width.
			chars add: array.
		].
	].

	chars := chars sorted: [:x :y | (x at: 2) <= (y at: 2)].
	charsNum := chars size. "undefined encodings make this different"

	charsNum > 256 ifTrue: [
		"it should be 94x94 charset, and should be fixed width font"
		strikeWidth := 94*94*maxWidth.
		maxAscii := 94*94.
		minAscii := 0.
		xTable := XTableForFixedFont new.
		xTable maxAscii: 94*94.
		xTable width: maxWidth.
	] ifFalse: [
		xTable := (Array new: 258) atAllPut: 0.
	].

	glyphs := Form extent: strikeWidth@height.
	blt := BitBlt toForm: glyphs.
	lastAscii := 0.
	
	charsNum > 256 ifTrue: [
		1 to: charsNum do: [:i |
			stream := ReadStream on: (chars at: i).
			form := stream next.
			encoding := stream next.
			bbx := stream next.
			encoding := ((encoding // 256) - 33) * 94 + ((encoding \\ 256) - 33).
			blt copy: ((encoding * maxWidth)@0 extent: maxWidth@height)
				from: 0@0 in: form.
		].
	] ifFalse: [
		1 to: charsNum do: [:i |
			stream := ReadStream on: (chars at: i).
			form := stream next.
			encoding := stream next.
			bbx := stream next.
			lastAscii+1 to: encoding-1 do: [:a | xTable at: a+2 put: (xTable at: a+1)].
			blt copy: (((xTable at: encoding+1)@(ascent - (bbx at: 2) - (bbx at: 4)))
					extent: (bbx at: 1)@(bbx at: 2))
				from: 0@0 in: form.
			xTable at: encoding+2 put: (xTable at: encoding+1)+(bbx at: 1).
			lastAscii := encoding.
		]
	].

	ret := Array new: 8.
	ret at: 1 put: xTable.
	ret at: 2 put: glyphs.
	ret at: 3 put: minAscii.
	ret at: 4 put: maxAscii.
	ret at: 5 put: maxWidth.
	ret at: 6 put: ascent.
	ret at: 7 put: descent.
	ret at: 8 put: pointSize.
	^ret.
" ^{xTable. glyphs. minAscii. maxAscii. maxWidth. ascent. descent. pointSize}"
