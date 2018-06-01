investigations
reportSenderCountsFor: selectorList 
	"Produce a report on the number of senders of each of the selectors in 
	the list. 1/27/96 sw"
	| _gsSqueakTemp_total _gsSqueakTemp_report |
	_gsSqueakTemp_total := 0.
	_gsSqueakTemp_report := '
'.
	selectorList
		do: [:selector | 
			| thisSize |
			thisSize := (self systemNavigation allCallsOn: selector) size.
			_gsSqueakTemp_report := _gsSqueakTemp_report , thisSize printString , String tab , selector printString , String cr.
			_gsSqueakTemp_total := _gsSqueakTemp_total + thisSize].
	_gsSqueakTemp_report := _gsSqueakTemp_report , '--- ------------------
'.
	_gsSqueakTemp_report := _gsSqueakTemp_report , _gsSqueakTemp_total printString , String tab , 'TOTAL
'.
	^ _gsSqueakTemp_report