inner loop
alphaSourceBlendBits32
	"This version assumes 
	combinationRule = 34
	sourcePixSize = destPixSize = 32
	sourceForm ~= destForm.
	Note: The inner loop has been optimized for dealing
	with the special cases of srcAlpha = 0.0 and srcAlpha = 1.0 
	"
	| _gsSqueakTemp_srcIndex _gsSqueakTemp_dstIndex _gsSqueakTemp_sourceWord _gsSqueakTemp_srcAlpha _gsSqueakTemp_destWord _gsSqueakTemp_deltaX _gsSqueakTemp_deltaY _gsSqueakTemp_srcY _gsSqueakTemp_dstY |
	<inline: false>
	"This particular method should be optimized in itself"
	"Give the compile a couple of hints"
	"The following should be declared as pointers so the compiler will
	notice that they're used for accessing memory locations 
	(good to know on an Intel architecture) but then the increments
	would be different between ST code and C code so must hope the
	compiler notices what happens (MS Visual C does)"
	_gsSqueakTemp_deltaY := bbH + 1.
	"So we can pre-decrement"
	_gsSqueakTemp_srcY := sy.
	_gsSqueakTemp_dstY := dy.
	"This is the outer loop"
	[(_gsSqueakTemp_deltaY := _gsSqueakTemp_deltaY - 1) ~= 0]
		whileTrue: [_gsSqueakTemp_srcIndex := sourceBits + (_gsSqueakTemp_srcY * sourcePitch) + (sx * 4).
			_gsSqueakTemp_dstIndex := destBits + (_gsSqueakTemp_dstY * destPitch) + (dx * 4).
			_gsSqueakTemp_deltaX := bbW + 1.
			"So we can pre-decrement"
			"This is the inner loop"
			[(_gsSqueakTemp_deltaX := _gsSqueakTemp_deltaX - 1) ~= 0]
				whileTrue: [_gsSqueakTemp_sourceWord := self srcLongAt: _gsSqueakTemp_srcIndex.
					_gsSqueakTemp_srcAlpha := _gsSqueakTemp_sourceWord >> 24.
					_gsSqueakTemp_srcAlpha = 255
						ifTrue: [self dstLongAt: _gsSqueakTemp_dstIndex put: _gsSqueakTemp_sourceWord.
							_gsSqueakTemp_srcIndex := _gsSqueakTemp_srcIndex + 4.
							_gsSqueakTemp_dstIndex := _gsSqueakTemp_dstIndex + 4.
							"Now copy as many words as possible with
							alpha = 255"
							[(_gsSqueakTemp_deltaX := _gsSqueakTemp_deltaX - 1) ~= 0
								and: [(_gsSqueakTemp_sourceWord := self srcLongAt: _gsSqueakTemp_srcIndex) >> 24 = 255]]
								whileTrue: [self dstLongAt: _gsSqueakTemp_dstIndex put: _gsSqueakTemp_sourceWord.
									_gsSqueakTemp_srcIndex := _gsSqueakTemp_srcIndex + 4.
									_gsSqueakTemp_dstIndex := _gsSqueakTemp_dstIndex + 4].
							"Adjust deltaX"
							_gsSqueakTemp_deltaX := _gsSqueakTemp_deltaX + 1]
						ifFalse: ["srcAlpha ~= 255"
							_gsSqueakTemp_srcAlpha = 0
								ifTrue: [_gsSqueakTemp_srcIndex := _gsSqueakTemp_srcIndex + 4.
									_gsSqueakTemp_dstIndex := _gsSqueakTemp_dstIndex + 4.
									"Now skip as many words as possible,"
									[(_gsSqueakTemp_deltaX := _gsSqueakTemp_deltaX - 1) ~= 0
										and: [(_gsSqueakTemp_sourceWord := self srcLongAt: _gsSqueakTemp_srcIndex) >> 24 = 0]]
										whileTrue: [_gsSqueakTemp_srcIndex := _gsSqueakTemp_srcIndex + 4.
											_gsSqueakTemp_dstIndex := _gsSqueakTemp_dstIndex + 4].
									"Adjust deltaX"
									_gsSqueakTemp_deltaX := _gsSqueakTemp_deltaX + 1]
								ifFalse: ["0 < srcAlpha < 255"
									"If we have to mix colors then just copy
									a single word"
									_gsSqueakTemp_destWord := self dstLongAt: _gsSqueakTemp_dstIndex.
									_gsSqueakTemp_destWord := self alphaBlendScaled: _gsSqueakTemp_sourceWord with: _gsSqueakTemp_destWord.
									self dstLongAt: _gsSqueakTemp_dstIndex put: _gsSqueakTemp_destWord.
									_gsSqueakTemp_srcIndex := _gsSqueakTemp_srcIndex + 4.
									_gsSqueakTemp_dstIndex := _gsSqueakTemp_dstIndex + 4]]].
			_gsSqueakTemp_srcY := _gsSqueakTemp_srcY + 1.
			_gsSqueakTemp_dstY := _gsSqueakTemp_dstY + 1]