misc
maximumThumbnailWidth	^ self		valueOfProperty: #maximumThumbnailWidth		ifAbsent: [200 min: self width - 10]