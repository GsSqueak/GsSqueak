class initialization
initializeStandardMIMETypes
	"FileDirectory initializeStandardMIMETypes"
	StandardMIMEMappings := Dictionary new.
	#(
		(gif		('image/gif'))
		(pdf	('application/pdf'))
		(aiff	('audio/aiff'))
		(bmp	('image/bmp'))
		(png	('image/png'))
		(swf	('application/x-shockwave-flash'))
		(htm	('text/html' 'text/plain'))
		(html	('text/html' 'text/plain'))
		(jpg	('image/jpeg'))
		(jpeg	('image/jpeg'))
		(mid	('audio/midi'))
		(midi	('audio/midi'))
		(mp3	('audio/mpeg'))
		(mpeg	('video/mpeg'))
		(mpg	('video/mpg'))
		(txt		('text/plain'))
		(text	('text/plain'))
		(mov	('video/quicktime'))
		(qt		('video/quicktime'))
		(tif		('image/tiff'))
		(tiff	('image/tiff'))
		(ttf		('application/x-truetypefont'))
		(wrl	('model/vrml'))
		(vrml	('model/vrml'))
		(wav	('audio/wav'))
	) do:[:spec|
		StandardMIMEMappings at: spec first asString put: spec last.
	].