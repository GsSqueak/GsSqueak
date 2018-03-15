instance creation
suppliedBy: topazProxy metaclassOf: class

	^ self new
		topazProxy: topazProxy;
		setSubject: class , ' class'