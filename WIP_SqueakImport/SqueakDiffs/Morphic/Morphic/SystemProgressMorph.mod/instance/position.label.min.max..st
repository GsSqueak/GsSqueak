private
position: aPoint label: shortDescription min: minValue max: maxValue
	| slot range barSize lastRefresh |
	self requestedPosition: aPoint.
	((range := maxValue - minValue) < 0 or: [(slot := self nextSlotFor: shortDescription) = 0])
		ifTrue: [^[:barVal| 0 ]].
	range <= 0 ifTrue: [self removeMorph: (self bars at: slot)].
	self reposition.
	self openInWorld.
	barSize := -1. "Enforces a inital draw of the morph"
	lastRefresh := 0.
	^[:barVal | | newBarSize |
		barVal isString ifTrue: [
			self setLabel: barVal at: slot.
			self currentWorld displayWorld].
		(barVal isNumber and: [range >= 1 and: [barVal between: minValue and: maxValue]]) ifTrue: [
			newBarSize := (barVal - minValue / range * BarWidth) truncated.
			newBarSize = barSize ifFalse: [
				barSize := newBarSize.
				(self bars at: slot) barSize: barSize.
				Time utcMicrosecondClock - lastRefresh > 25000 ifTrue: [
					self currentWorld displayWorld.
					lastRefresh := Time utcMicrosecondClock]]].
		slot]