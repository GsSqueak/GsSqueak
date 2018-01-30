inner loop
copyLoop
	"This version of the inner loop assumes noSource = false."
	| _gsSqueakTemp_prevWord _gsSqueakTemp_thisWord _gsSqueakTemp_skewWord _gsSqueakTemp_halftoneWord _gsSqueakTemp_mergeWord _gsSqueakTemp_hInc _gsSqueakTemp_y _gsSqueakTemp_unskew _gsSqueakTemp_skewMask _gsSqueakTemp_notSkewMask _gsSqueakTemp_mergeFnwith _gsSqueakTemp_destWord |
	<inline: false>
	<var: #mergeFnwith declareC: 'sqInt (*mergeFnwith)(sqInt, sqInt)'>
	_gsSqueakTemp_mergeFnwith := self
				cCoerce: (opTable at: combinationRule + 1)
				to: 'sqInt (*)(sqInt, sqInt)'.
	_gsSqueakTemp_mergeFnwith.
	"null ref for compiler"
	_gsSqueakTemp_hInc := hDir * 4.
	"Byte delta"
	"degenerate skew fixed for Sparc. 10/20/96 ikp"
	skew == -32
		ifTrue: [skew := _gsSqueakTemp_unskew := _gsSqueakTemp_skewMask := 0]
		ifFalse: [skew < 0
				ifTrue: [_gsSqueakTemp_unskew := skew + 32.
					_gsSqueakTemp_skewMask := AllOnes << (0 - skew)]
				ifFalse: [skew = 0
						ifTrue: [_gsSqueakTemp_unskew := 0.
							_gsSqueakTemp_skewMask := AllOnes]
						ifFalse: [_gsSqueakTemp_unskew := skew - 32.
							_gsSqueakTemp_skewMask := AllOnes >> skew]]].
	_gsSqueakTemp_notSkewMask := _gsSqueakTemp_skewMask bitInvert32.
	noHalftone
		ifTrue: [_gsSqueakTemp_halftoneWord := AllOnes.
			halftoneHeight := 0]
		ifFalse: [_gsSqueakTemp_halftoneWord := self halftoneAt: 0].
	_gsSqueakTemp_y := dy.
	1
		to: bbH
		do: [:i | 
			"here is the vertical loop"
			halftoneHeight > 1
				ifTrue: ["Otherwise, its always the same"
					_gsSqueakTemp_halftoneWord := self halftoneAt: _gsSqueakTemp_y.
					_gsSqueakTemp_y := _gsSqueakTemp_y + vDir].
			preload
				ifTrue: ["load the 64-bit shifter"
					_gsSqueakTemp_prevWord := self srcLongAt: sourceIndex.
					sourceIndex := sourceIndex + _gsSqueakTemp_hInc]
				ifFalse: [_gsSqueakTemp_prevWord := 0].
			"Note: the horizontal loop has been expanded into three parts
			for speed:"
			"This first section requires masking of the destination store..."
			destMask := mask1.
			_gsSqueakTemp_thisWord := self srcLongAt: sourceIndex.
			"pick up next word"
			sourceIndex := sourceIndex + _gsSqueakTemp_hInc.
			_gsSqueakTemp_skewWord := ((_gsSqueakTemp_prevWord bitAnd: _gsSqueakTemp_notSkewMask)
						bitShift: _gsSqueakTemp_unskew)
						bitOr: ((_gsSqueakTemp_thisWord bitAnd: _gsSqueakTemp_skewMask)
								bitShift: skew).
			"32-bit rotate"
			_gsSqueakTemp_prevWord := _gsSqueakTemp_thisWord.
			_gsSqueakTemp_destWord := self dstLongAt: destIndex.
			_gsSqueakTemp_mergeWord := self
						mergeFn: (_gsSqueakTemp_skewWord bitAnd: _gsSqueakTemp_halftoneWord)
						with: _gsSqueakTemp_destWord.
			_gsSqueakTemp_destWord := (destMask bitAnd: _gsSqueakTemp_mergeWord)
						bitOr: (_gsSqueakTemp_destWord bitAnd: destMask bitInvert32).
			self dstLongAt: destIndex put: _gsSqueakTemp_destWord.
			destIndex := destIndex + _gsSqueakTemp_hInc.
			"This central horizontal loop requires no store masking"
			destMask := AllOnes.
			combinationRule = 3
				ifTrue: [skew = 0 & (_gsSqueakTemp_halftoneWord = AllOnes)
						ifTrue: ["Very special inner loop for STORE mode with
							no skew -- just move words"
							hDir = -1
								ifTrue: ["Woeful patch: revert to older code for
									hDir = -1"
									2
										to: nWords - 1
										do: [:word | 
											_gsSqueakTemp_thisWord := self srcLongAt: sourceIndex.
											sourceIndex := sourceIndex + _gsSqueakTemp_hInc.
											self dstLongAt: destIndex put: _gsSqueakTemp_thisWord.
											destIndex := destIndex + _gsSqueakTemp_hInc]]
								ifFalse: [2
										to: nWords - 1
										do: [:word | 
											"Note loop starts with
											prevWord loaded (due to
											preload) "
											self dstLongAt: destIndex put: _gsSqueakTemp_prevWord.
											destIndex := destIndex + _gsSqueakTemp_hInc.
											_gsSqueakTemp_prevWord := self srcLongAt: sourceIndex.
											sourceIndex := sourceIndex + _gsSqueakTemp_hInc]]]
						ifFalse: ["Special inner loop for STORE mode -- no need
							to call merge"
							2
								to: nWords - 1
								do: [:word | 
									_gsSqueakTemp_thisWord := self srcLongAt: sourceIndex.
									sourceIndex := sourceIndex + _gsSqueakTemp_hInc.
									_gsSqueakTemp_skewWord := ((_gsSqueakTemp_prevWord bitAnd: _gsSqueakTemp_notSkewMask)
												bitShift: _gsSqueakTemp_unskew)
												bitOr: ((_gsSqueakTemp_thisWord bitAnd: _gsSqueakTemp_skewMask)
														bitShift: skew).
									"32-bit rotate"
									_gsSqueakTemp_prevWord := _gsSqueakTemp_thisWord.
									self
										dstLongAt: destIndex
										put: (_gsSqueakTemp_skewWord bitAnd: _gsSqueakTemp_halftoneWord).
									destIndex := destIndex + _gsSqueakTemp_hInc]]]
				ifFalse: [2
						to: nWords - 1
						do: [:word | 
							"Normal inner loop does merge:"
							_gsSqueakTemp_thisWord := self srcLongAt: sourceIndex.
							"pick up next word"
							sourceIndex := sourceIndex + _gsSqueakTemp_hInc.
							_gsSqueakTemp_skewWord := ((_gsSqueakTemp_prevWord bitAnd: _gsSqueakTemp_notSkewMask)
										bitShift: _gsSqueakTemp_unskew)
										bitOr: ((_gsSqueakTemp_thisWord bitAnd: _gsSqueakTemp_skewMask)
												bitShift: skew).
							"32-bit rotate"
							_gsSqueakTemp_prevWord := _gsSqueakTemp_thisWord.
							_gsSqueakTemp_mergeWord := self
										mergeFn: (_gsSqueakTemp_skewWord bitAnd: _gsSqueakTemp_halftoneWord)
										with: (self dstLongAt: destIndex).
							self dstLongAt: destIndex put: _gsSqueakTemp_mergeWord.
							destIndex := destIndex + _gsSqueakTemp_hInc]].
			"This last section, if used, requires masking of the destination
			store... "
			nWords > 1
				ifTrue: [destMask := mask2.
					_gsSqueakTemp_thisWord := self srcLongAt: sourceIndex.
					"pick up next word"
					sourceIndex := sourceIndex + _gsSqueakTemp_hInc.
					_gsSqueakTemp_skewWord := ((_gsSqueakTemp_prevWord bitAnd: _gsSqueakTemp_notSkewMask)
								bitShift: _gsSqueakTemp_unskew)
								bitOr: ((_gsSqueakTemp_thisWord bitAnd: _gsSqueakTemp_skewMask)
										bitShift: skew).
					"32-bit rotate"
					_gsSqueakTemp_destWord := self dstLongAt: destIndex.
					_gsSqueakTemp_mergeWord := self
								mergeFn: (_gsSqueakTemp_skewWord bitAnd: _gsSqueakTemp_halftoneWord)
								with: _gsSqueakTemp_destWord.
					_gsSqueakTemp_destWord := (destMask bitAnd: _gsSqueakTemp_mergeWord)
								bitOr: (_gsSqueakTemp_destWord bitAnd: destMask bitInvert32).
					self dstLongAt: destIndex put: _gsSqueakTemp_destWord.
					destIndex := destIndex + _gsSqueakTemp_hInc].
			sourceIndex := sourceIndex + sourceDelta.
			destIndex := destIndex + destDelta]