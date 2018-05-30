running
installProjectFrom: loader
	self showSplashMorph.
	[[[
		loader installProject
	] on: ProjectViewOpenNotification
	  do:[:ex| ex resume: false] "no project view in plugin launcher"
	] on: ProgressInitiationException "no 'reading aStream' nonsense"
	  do:[:ex| ex sendNotificationsTo: [ :min :max :curr |]]
	] on: ProjectEntryNotification "hide splash morph when entering project"
       do:[:ex| self hideSplashMorph. ex pass].