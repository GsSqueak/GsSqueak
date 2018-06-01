installation
installMember: member
	 
	self useNewChangeSetDuring:
		[ | contents |
		contents := self contentsForMember: member.
		contents readStream fileInAnnouncing: 'loading ', member fileName.
		]