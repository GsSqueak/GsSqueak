host window access
hostWindowIndex
	"By convention, the reference to the primary Squeak display window is 1.
	The host window plugin may use different conventions for references to
	windows. In general, the handles for references to host windows should be
	considered as meaningful only to the VM plugin, with host window index 1
	being a special case of a well known handle value."

	^ 1