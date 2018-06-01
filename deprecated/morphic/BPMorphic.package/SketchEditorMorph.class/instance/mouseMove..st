event handling
mouseMove: evt 
	"In the middle of drawing a stroke. 6/11/97 19:51 tk"
	| _gsSqueakTemp_pt _gsSqueakTemp_priorEvt |
	WorldState canSurrenderToOS: false.
	"we want maximum responsiveness"
	_gsSqueakTemp_pt := evt cursorPoint.
	_gsSqueakTemp_priorEvt := self get: #lastEvent for: evt.
	(_gsSqueakTemp_priorEvt notNil
			and: [_gsSqueakTemp_pt = _gsSqueakTemp_priorEvt cursorPoint])
		ifTrue: [^ self].
	self
		perform: (self getActionFor: evt)
		with: evt.
	"Each action must do invalidRect:"
	self
		set: #lastEvent
		for: evt
		to: evt.
	false
		ifTrue: ["So senders will find the things performed here"
			self paint: nil;
				 fill: nil;
				 erase: nil;
				 pickup: nil;
				 stamp: nil.
			self rect: nil;
				 ellipse: nil;
				 polygon: nil;
				 line: nil;
				 star: nil]