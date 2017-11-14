as yet unclassified
testSendMail
"a simple mail test"

| smtpClient |
smtpClient := SMTPClient openOnHost: #[127 0 0 1] port: 1111.
smtpClient user: 'trinkliste.hpi@gmx.de'.
smtpClient password: 'ee3Oozoh'.
"smtpClient login."
smtpClient mailFrom: 'trinkliste.hpi@gmx.de' to: #( 'jakob.braun@posteo.de' ) text: 'wow es klappt!'.
smtpClient quit.