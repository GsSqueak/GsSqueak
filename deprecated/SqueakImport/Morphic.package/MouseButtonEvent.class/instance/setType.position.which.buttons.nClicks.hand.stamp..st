private
setType: evtType position: evtPos which: button buttons: evtButtons nClicks: numClicks  hand: evtHand stamp: stamp
	type := evtType.
	position := evtPos.
	buttons := evtButtons.
	nClicks := numClicks.
	source := evtHand.
	wasHandled := false.
	whichButton := button.
	timeStamp := stamp