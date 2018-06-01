scroll cache
deriveHScrollRange
	| _gsSqueakTemp_unadjustedRange _gsSqueakTemp_totalRange |
	(list isNil
			or: [list isEmpty])
		ifTrue: [hScrollRangeCache := Array
						with: 0
						with: 0
						with: 0
						with: 0
						with: 0]
		ifFalse: [_gsSqueakTemp_unadjustedRange := self listMorph hUnadjustedScrollRange.
			_gsSqueakTemp_totalRange := _gsSqueakTemp_unadjustedRange + self hExtraScrollRange + self hMargin.
			hScrollRangeCache := Array
						with: _gsSqueakTemp_totalRange
						with: _gsSqueakTemp_unadjustedRange
						with: list size
						with: list first
						with: list last]