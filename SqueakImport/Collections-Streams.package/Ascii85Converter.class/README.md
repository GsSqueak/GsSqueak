I convert between binary data and an Ascii85 text representation of PostScript and PDF fame.
I am a little bit more efficient (~25% overhead) than Base64 (~30% overhead).

Instance Variables
	binary:		<Boolean>	- Tells whether to decode to binary data or characters
	dataStream:		<PositionableStream> - The data stream to decode to or encode from (Typically does not contain Ascii85)
	stringStream:		<PositionableStream> - The text stream to decode from or encode to (Always contains Ascii85)
	number85:		<Integer> - Decoder state, accumulated read number in base85
	tupleSize:		<SmallInteger> - Number of bytes read into number85 already
			
'Hello, World' ascii85Encoded.

'<~87cURD]htuF_+us~>' ascii85Decoded.
