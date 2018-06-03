toolbuilder
buildButtonsWith: builder

	^ {	builder pluggableButtonSpec new
				model: self;
				label: 'Accept';
				color: (self userInterfaceTheme get: #okColor for: #DialogWindow);
				enabled: #mightBeValid;
				action: #accept.
		builder pluggableButtonSpec new
				model: self;
				label: 'Cancel';
				color: (self userInterfaceTheme get: #cancelColor for: #DialogWindow);
				action: #cancel}