primitives
primitiveDisplayString
	| _gsSqueakTemp_kernDelta _gsSqueakTemp_xTable _gsSqueakTemp_glyphMap _gsSqueakTemp_stopIndex _gsSqueakTemp_startIndex _gsSqueakTemp_sourceString _gsSqueakTemp_bbObj _gsSqueakTemp_maxGlyph _gsSqueakTemp_ascii _gsSqueakTemp_glyphIndex _gsSqueakTemp_sourcePtr _gsSqueakTemp_left _gsSqueakTemp_quickBlt |
	<export: true>
	<var: #sourcePtr type: 'char *'>
	interpreterProxy methodArgumentCount = 6
		ifFalse: [^ interpreterProxy primitiveFail].
	_gsSqueakTemp_kernDelta := interpreterProxy stackIntegerValue: 0.
	_gsSqueakTemp_xTable := interpreterProxy stackObjectValue: 1.
	_gsSqueakTemp_glyphMap := interpreterProxy stackObjectValue: 2.
	((interpreterProxy fetchClassOf: _gsSqueakTemp_xTable)
				= interpreterProxy classArray
			and: [(interpreterProxy fetchClassOf: _gsSqueakTemp_glyphMap)
					= interpreterProxy classArray])
		ifFalse: [^ interpreterProxy primitiveFail].
	(interpreterProxy slotSizeOf: _gsSqueakTemp_glyphMap)
			= 256
		ifFalse: [^ interpreterProxy primitiveFail].
	interpreterProxy failed
		ifTrue: [^ nil].
	_gsSqueakTemp_maxGlyph := (interpreterProxy slotSizeOf: _gsSqueakTemp_xTable)
				- 2.
	_gsSqueakTemp_stopIndex := interpreterProxy stackIntegerValue: 3.
	_gsSqueakTemp_startIndex := interpreterProxy stackIntegerValue: 4.
	_gsSqueakTemp_sourceString := interpreterProxy stackObjectValue: 5.
	(interpreterProxy isBytes: _gsSqueakTemp_sourceString)
		ifFalse: [^ interpreterProxy primitiveFail].
	(_gsSqueakTemp_startIndex > 0
			and: [_gsSqueakTemp_stopIndex > 0
					and: [_gsSqueakTemp_stopIndex
							<= (interpreterProxy byteSizeOf: _gsSqueakTemp_sourceString)]])
		ifFalse: [^ interpreterProxy primitiveFail].
	_gsSqueakTemp_bbObj := interpreterProxy stackObjectValue: 6.
	(self loadBitBltFrom: _gsSqueakTemp_bbObj)
		ifFalse: [^ interpreterProxy primitiveFail].
	(combinationRule = 30
			or: [combinationRule = 31])
		ifTrue: ["needs extra source alpha"
			^ interpreterProxy primitiveFail].
	"See if we can go directly into copyLoopPixMap (usually we can)"
	_gsSqueakTemp_quickBlt := destBits ~= 0
				and: ["no OS surfaces please"
					sourceBits ~= 0
						and: ["and again"
							noSource = false
								and: ["needs a source"
									sourceForm ~= destForm
										and: ["no blits onto self"
											cmFlags ~= 0
												or: [sourceMSB ~= destMSB
														or: [sourceDepth ~= destDepth]]
											"no point using slower version"]]]].
	_gsSqueakTemp_left := destX.
	_gsSqueakTemp_sourcePtr := interpreterProxy firstIndexableField: _gsSqueakTemp_sourceString.
	_gsSqueakTemp_startIndex
		to: _gsSqueakTemp_stopIndex
		do: [:charIndex | 
			_gsSqueakTemp_ascii := self byteAtPointer: _gsSqueakTemp_sourcePtr + charIndex - 1.
			_gsSqueakTemp_glyphIndex := interpreterProxy fetchInteger: _gsSqueakTemp_ascii ofObject: _gsSqueakTemp_glyphMap.
			(_gsSqueakTemp_glyphIndex < 0
					or: [_gsSqueakTemp_glyphIndex > _gsSqueakTemp_maxGlyph])
				ifTrue: [^ interpreterProxy primitiveFail].
			sourceX := interpreterProxy fetchInteger: _gsSqueakTemp_glyphIndex ofObject: _gsSqueakTemp_xTable.
			width := (interpreterProxy fetchInteger: _gsSqueakTemp_glyphIndex + 1 ofObject: _gsSqueakTemp_xTable)
						- sourceX.
			interpreterProxy failed
				ifTrue: [^ nil].
			self clipRange.
			"Must clip here"
			(bbW > 0
					and: [bbH > 0])
				ifTrue: [_gsSqueakTemp_quickBlt
						ifTrue: [self destMaskAndPointerInit.
							self copyLoopPixMap.
							"both, hDir and vDir are known to be > 0"
							affectedL := dx.
							affectedR := dx + bbW.
							affectedT := dy.
							affectedB := dy + bbH]
						ifFalse: [self copyBits]].
			interpreterProxy failed
				ifTrue: [^ nil].
			destX := destX + width + _gsSqueakTemp_kernDelta].
	affectedL := _gsSqueakTemp_left.
	self showDisplayBits.
	"store destX back"
	interpreterProxy
		storeInteger: BBDestXIndex
		ofObject: _gsSqueakTemp_bbObj
		withValue: destX.
	interpreterProxy pop: 6