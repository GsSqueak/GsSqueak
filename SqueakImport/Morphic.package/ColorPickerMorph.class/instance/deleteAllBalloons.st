private
deleteAllBalloons

	self submorphsDo: [:m | m deleteBalloon].
