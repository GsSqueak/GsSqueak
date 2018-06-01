GET processing
quickSortGlobalEdgeTable: array from: i to: j 
	"Sort elements i through j of self to be nondescending according to
	sortBlock."
	"Note: The original loop has been heavily re-written for C translation"
	| _gsSqueakTemp_di _gsSqueakTemp_dij _gsSqueakTemp_dj _gsSqueakTemp_tt _gsSqueakTemp_ij _gsSqueakTemp_k _gsSqueakTemp_l _gsSqueakTemp_n _gsSqueakTemp_tmp _gsSqueakTemp_again _gsSqueakTemp_before |
	"The prefix d means the data at that index."
	(_gsSqueakTemp_n := j + 1 - i) <= 1
		ifTrue: [^ 0].
	"Nothing to sort."
	"Sort di,dj."
	_gsSqueakTemp_di := array at: i.
	_gsSqueakTemp_dj := array at: j.
	_gsSqueakTemp_before := self getSorts: _gsSqueakTemp_di before: _gsSqueakTemp_dj.
	"i.e., should di precede dj?"
	_gsSqueakTemp_before
		ifFalse: [_gsSqueakTemp_tmp := array at: i.
			array
				at: i
				put: (array at: j).
			array at: j put: _gsSqueakTemp_tmp.
			_gsSqueakTemp_tt := _gsSqueakTemp_di.
			_gsSqueakTemp_di := _gsSqueakTemp_dj.
			_gsSqueakTemp_dj := _gsSqueakTemp_tt].
	_gsSqueakTemp_n <= 2
		ifTrue: [^ 0].
	"More than two elements."
	_gsSqueakTemp_ij := i + j // 2.
	"ij is the midpoint of i and j."
	_gsSqueakTemp_dij := array at: _gsSqueakTemp_ij.
	"Sort di,dij,dj. Make dij be their median."
	_gsSqueakTemp_before := self getSorts: _gsSqueakTemp_di before: _gsSqueakTemp_dij.
	"i.e. should di precede dij?"
	_gsSqueakTemp_before
		ifTrue: [_gsSqueakTemp_before := self getSorts: _gsSqueakTemp_dij before: _gsSqueakTemp_dj.
			"i.e., should dij precede dj?"
			_gsSqueakTemp_before
				ifFalse: ["i.e., should dij precede dj?"
					_gsSqueakTemp_tmp := array at: j.
					array
						at: j
						put: (array at: _gsSqueakTemp_ij).
					array at: _gsSqueakTemp_ij put: _gsSqueakTemp_tmp.
					_gsSqueakTemp_dij := _gsSqueakTemp_dj]]
		ifFalse: ["i.e. di should come after dij"
			_gsSqueakTemp_tmp := array at: i.
			array
				at: i
				put: (array at: _gsSqueakTemp_ij).
			array at: _gsSqueakTemp_ij put: _gsSqueakTemp_tmp.
			_gsSqueakTemp_dij := _gsSqueakTemp_di].
	_gsSqueakTemp_n <= 3
		ifTrue: [^ 0].
	"More than three elements."
	"Find k>i and l<j such that dk,dij,dl are in reverse order.
	Swap k and l. Repeat this procedure until k and l pass each other."
	_gsSqueakTemp_k := i.
	_gsSqueakTemp_l := j.
	_gsSqueakTemp_again := true.
	[_gsSqueakTemp_again]
		whileTrue: [_gsSqueakTemp_before := true.
			[_gsSqueakTemp_before]
				whileTrue: [_gsSqueakTemp_k <= (_gsSqueakTemp_l := _gsSqueakTemp_l - 1)
						ifTrue: [_gsSqueakTemp_tmp := array at: _gsSqueakTemp_l.
							_gsSqueakTemp_before := self getSorts: _gsSqueakTemp_dij before: _gsSqueakTemp_tmp]
						ifFalse: [_gsSqueakTemp_before := false]].
			_gsSqueakTemp_before := true.
			[_gsSqueakTemp_before]
				whileTrue: [(_gsSqueakTemp_k := _gsSqueakTemp_k + 1) <= _gsSqueakTemp_l
						ifTrue: [_gsSqueakTemp_tmp := array at: _gsSqueakTemp_k.
							_gsSqueakTemp_before := self getSorts: _gsSqueakTemp_tmp before: _gsSqueakTemp_dij]
						ifFalse: [_gsSqueakTemp_before := false]].
			_gsSqueakTemp_again := _gsSqueakTemp_k <= _gsSqueakTemp_l.
			_gsSqueakTemp_again
				ifTrue: [_gsSqueakTemp_tmp := array at: _gsSqueakTemp_k.
					array
						at: _gsSqueakTemp_k
						put: (array at: _gsSqueakTemp_l).
					array at: _gsSqueakTemp_l put: _gsSqueakTemp_tmp]].
	"Now l<k (either 1 or 2 less), and di through dl are all less than or
	equal to dk
	through dj. Sort those two segments."
	self
		quickSortGlobalEdgeTable: array
		from: i
		to: _gsSqueakTemp_l.
	self
		quickSortGlobalEdgeTable: array
		from: _gsSqueakTemp_k
		to: j