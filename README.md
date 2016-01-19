# Wercker md-email

A Wercker step to send markdown emails.

## Usage:

include the following step in your `wercker.yml`, `steps` or
`after-steps`:

```
- romeovs/md-mail-notify:
    user: me@example.com
    host: smtp.example.com
    ssl: yes
    file: ./path/to/email.md
```

This will read the email file and send it using the 
specified credentials using [`md-mailer`][md-mailer].

You will need to specify the password using the 
`WERCKER_MD_MAIL_PASS` environment variable.

[`md-mailer`][md-mailer] has the handy feature that it
can interpolate environment variables in the email file.
For example, `${FOO} is $BAR!` with an environment containing
`FOO=email` and `BAR=fun` will interpolate to `email is fun!`.

This is nice if you want to include things that depend on the current
build (the build status for example).

Check the [`md-mailer`][md-mailer] docs for more information.

[md-mailer]: https://github.com/romeovs/md-mailer