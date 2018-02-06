inner loop
copyLoopNoSource
	"Faster copyLoop when source not used. hDir and vDir are both
	positive, and perload and skew are unused"
	| _gsSqueakTemp_halftoneWord _gsSqueakTemp_mergeWord _gsSqueakTemp_mergeFnwith _gsSqueakTemp_destWord |
	<inline: false>
	<var: #mergeFnwith declareC: 'sqInt (*mergeFnwith)(sqInt, sqInt)'>
	_gsSqueakTemp_mergeFnwith := self
				cCoerce: (opTable at: combinationRule + 1)
				to: 'sqInt (*)(sqInt, sqInt)'.
	_gsSqueakTemp_mergeFnwith.
	"null ref for compiler"
	1
		to: bbH
		do: [:i | 
			"here is the vertical loop"
			noHalftone
				ifTrue: [_gsSqueakTemp_halftoneWord := AllOnes]
				ifFalse: [_gsSqueakTemp_halftoneWord := self halftoneAt: dy + i - 1].
			"Note: the horizontal loop has been expanded into three parts
			for speed:"
			"This first section requires masking of the destination store..."
			destMask := mask1.
			_gsSqueakTemp_destWord := self dstLongAt: destIndex.
			_gsSqueakTemp_mergeWord := self mergeFn: _gsSqueakTemp_halftoneWord with: _gsSqueakTemp_destWord.
			_gsSqueakTemp_destWord := (destMask bitAnd: _gsSqueakTemp_mergeWord)
						bitOr: (_gsSqueakTemp_destWord bitAnd: destMask bitInvert32).
			self dstLongAt: destIndex put: _gsSqueakTemp_destWord.
			destIndex := destIndex + 4.
			"This central horizontal loop requires no store masking"
			destMask := AllOnes.
			combinationRule = 3
				ifTrue: ["Special inner loop for STORE"
					_gsSqueakTemp_destWord := _gsSqueakTemp_halftoneWord.
					2
						to: nWords - 1
						do: [:word | 
							self dstLongAt: destIndex put: _gsSqueakTemp_destWord.
							destIndex := destIndex + 4]]
				ifFalse: ["Normal inner loop does merge"
					2
						to: nWords - 1
						do: [:word | 
							"Normal inner loop does merge"
							_gsSqueakTemp_destWord := self dstLongAt: destIndex.
							_gsSqueakTemp_mergeWord := self mergeFn: _gsSqueakTemp_halftoneWord with: _gsSqueakTemp_destWord.
							self dstLongAt: destIndex put: _gsSqueakTemp_mergeWord.
							destIndex := destIndex + 4]].
			"This last section, if used, requires masking of the destination
			store... "
			nWords > 1
				ifTrue: [destMask := mask2.
					_gsSqueakTemp_destWord := self dstLongAt: destIndex.
					_gsSqueakTemp_mergeWord := self mergeFn: _gsSqueakTemp_halftoneWord with: _gsSqueakTemp_destWord.
					_gsSqueakTemp_destWord := (destMask bitAnd: _gsSqueakTemp_mergeWord)
								bitOr: (_gsSqueakTemp_destWord bitAnd: destMask bitInvert32).
					self dstLongAt: destIndex put: _gsSqueakTemp_destWord.
					destIndex := destIndex + 4].
			destIndex := destIndex + destDelta]