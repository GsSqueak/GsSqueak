instance creation
interface: aGSGInterface class: classProxy env: envId

	^ self new
		interface: aGSGInterface;
		subject: classProxy;
		envId: envId