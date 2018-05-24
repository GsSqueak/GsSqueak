mime file in/out
collectionFromCompressedMIMEString: aString
	"aString holds a compressed, Base64 representation of a SmartRefStream storage of a TextStyle.
	Install the TextStyle."

	| this newName style data |
	data := (Base64MimeConverter mimeDecode: aString as: String) unzipped.
	(RWBinaryOrTextStream with: data) reset; fileIn.
	this := SmartRefStream scannedObject.

	"now install it"

	newName := this fontArray first familyName.
	this fontArray do: [:aFont | aFont familyName = newName ifFalse: [
		self error: 'All must be same family']].
	style := TextConstants at: newName asSymbol ifAbsent: [
		^ TextConstants at: newName asSymbol put: this].		"new family"
	this fontArray do: [:aFont | | heights | "add new fonts"
		heights := style fontArray collect: [:bFont | bFont height].
		(heights includes: aFont height) ifFalse: [
			style fontAt: style fontArray size + 1 put: aFont]].
