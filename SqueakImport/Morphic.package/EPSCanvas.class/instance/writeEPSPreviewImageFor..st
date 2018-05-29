private
writeEPSPreviewImageFor: aMorph
	| form stream string newExtent |
	newExtent := (aMorph width roundUpTo: 8) @ aMorph height.
	form := aMorph imageForm: 1 forRectangle: (aMorph bounds origin extent: newExtent).
	stream := WriteStream on: (String new: (form bits byteSize * 2.04) asInteger).
	form storePostscriptHexOn: stream.
	string := stream contents.

	"%%BeginPreview: 80 24 1 24"
	"width height depth "
	target print: '%%BeginPreview: '; write:  newExtent; space; write: form depth; space; write: string lineCount; cr.

	string linesDo: [:e | target nextPut: $%; nextPutAll: e; cr.].

	target print: '%%EndPreview'; cr.

