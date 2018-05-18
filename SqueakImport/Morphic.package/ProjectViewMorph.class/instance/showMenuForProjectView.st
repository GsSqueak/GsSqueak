events
showMenuForProjectView
	| menu |
	(menu := MenuMorph new)
		add: 'enter this project' translated
		action: [^ self enter];

 		add: 'ENTER ACTIVE' translated
		action: [self setProperty: #wasOpenedAsSubproject toValue: true.
            ^ self enterAsActiveSubproject];
		
		add: 'PUBLISH (also saves a local copy)' translated
		action: [^ project storeOnServerShowProgressOn: self forgetURL: false];
		
		add: 'PUBLISH to a different server' translated
		action: [project forgetExistingURL.
			^ project storeOnServerShowProgressOn: self forgetURL: true];
		
		add: 'see if server version is more recent' translated
		action: [^ self checkForNewerVersionAndLoad];

		addLine;
		add: 'expunge this project' translated
		action: [^ self expungeProject].

	menu title: ('Project Named \"{1}"' translated withCRs format: {project name}).
	menu invokeModal.