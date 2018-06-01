class initialization
initialize

	SchemeRegistry := Dictionary new
		at: 'browser' put: BrowserUrl;
		at: 'file' put: FileUrl;
		at: 'ftp' put: FtpUrl;
		at: 'http' put: HttpUrl;
		at: 'https' put: HttpUrl;
		at: 'mailto' put: MailtoUrl;
		at: nil put: HttpUrl;
		yourself