postscript generation
printPostscript: aStream operator: operator 
	aStream preserveStateDuring: 
			[:inner | 
			inner rectclip: (0 @ 0 extent: width @ height).
			self setColorspaceOn: inner.
			inner
				print: '[ ';
				cr;
				print: '/ImageType 1';
				cr;
				print: '/ImageMatrix [1 0 0 1 0 0]';
				cr;
				print: '/MultipleDataSources false';
				cr;
				print: '/DataSource level1 { { currentfile ';
				write: self bytesPerRow;
				print: ' string readhexstring pop }} bind { currentfile /ASCIIHexDecode filter } ifelse';
				cr;
				print: '/Width ';
				write: self paddedWidth;
				cr;
				print: '/Height ';
				write: self height;
				cr;
				print: '/Decode ';
				print: self decodeArray;
				cr;
				print: '/BitsPerComponent ';
				write: self bitsPerComponent;
				cr;
				print: 'makeDict ';
				print: operator;
				cr.
			self storePostscriptHexOn: inner.
			inner
				print: $>;
				cr.
			inner cr].
	aStream cr