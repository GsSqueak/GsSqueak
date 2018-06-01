simple keyboard
mouseMovePitch: pitch event: event noteMorph: noteMorph

	(noteMorph containsPoint: event cursorPoint) ifFalse:
		["If drag out of me, zap focus so other morphs can see drag in."
		event hand releaseMouseFocus: noteMorph]
