private
setType: evtType position: evtPos delta: evtDelta direction: dirFlags buttons: evtButtons hand: evtHand stamp: stamp
	type := evtType.
	position := evtPos.
	buttons := evtButtons.
	source := evtHand.
	wasHandled := false.
	direction := dirFlags.
	delta := evtDelta.
	timeStamp := stamp.