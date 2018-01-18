layout-properties
copyLayoutProperties	^ [Clipboard clipboardText: self layoutProperties stringWithLayout]		ifError: []