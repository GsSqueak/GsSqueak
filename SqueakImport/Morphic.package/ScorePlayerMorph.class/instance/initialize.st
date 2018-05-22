initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	""
	self listDirection: #topToBottom;
		 wrapCentering: #center;
		 cellPositioning: #topCenter;
		 hResizing: #shrinkWrap;
		 vResizing: #shrinkWrap;
		 layoutInset: 3;
		 onScorePlayer: ScorePlayer new initialize title: ' ';
		 extent: 20 @ 20 