*Compression-Streams
unzipped
	| magic1 magic2 |
	magic1 := self at: 1.
	magic2 := self at: 2.
	(magic1 = 16r1F and:[magic2 = 16r8B]) ifFalse:[^self].
	^(GZipReadStream on: self) upToEnd