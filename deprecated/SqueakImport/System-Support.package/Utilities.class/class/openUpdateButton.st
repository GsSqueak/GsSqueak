user interface
openUpdateButton
	PluggableButtonMorph new
		label: 'Load Code Updates';
		model: MCMcmUpdater;
		action: #updateFromServer;
		openInHand