toolbuilder
buildButtonsWith: builder

	^ {
		builder pluggableButtonSpec new
				model: self;
				label: 'Accept' translated;
				color: (self userInterfaceTheme get: #okColor for: #DialogWindow);
				action: #acceptFileName.
		builder pluggableButtonSpec new
				model: self;
				label: 'Cancel';
				color: (self userInterfaceTheme get: #cancelColor for: #DialogWindow);
				action: #cancelFileChooser}