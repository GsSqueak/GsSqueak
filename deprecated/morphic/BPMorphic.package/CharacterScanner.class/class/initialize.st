class initialization
initialize
	"
	CharacterScanner initializ
	"
	| _gsSqueakTemp_a |
	_gsSqueakTemp_a := Array new: 258.
	_gsSqueakTemp_a at: 1 + 1 put: #embeddedObject.
	_gsSqueakTemp_a at: Tab asciiValue + 1 put: #tab.
	_gsSqueakTemp_a at: CR asciiValue + 1 put: #cr.
	_gsSqueakTemp_a at: Character lf asciiValue + 1 put: #cr.
	"Note: following two codes are used only by primitive 103 for
	accelerated Character scanning"
	_gsSqueakTemp_a at: 257 put: #endOfRun.
	_gsSqueakTemp_a at: 258 put: #crossedX.
	DefaultStopConditions := _gsSqueakTemp_a copy.
	CompositionStopConditions := _gsSqueakTemp_a copy.
	CompositionStopConditions at: Space asciiValue + 1 put: #space.
	ColumnBreakStopConditions := CompositionStopConditions copy.
	ColumnBreakStopConditions at: Character characterForColumnBreak asciiValue + 1 put: #columnBreak.
	PaddedSpaceCondition := _gsSqueakTemp_a copy.
	PaddedSpaceCondition at: Space asciiValue + 1 put: #paddedSpace.
	MeasuringStopConditions := (Array new: 258) at: 257 put: #endOfRun;
				 at: 258 put: #crossedX;
				 yourself