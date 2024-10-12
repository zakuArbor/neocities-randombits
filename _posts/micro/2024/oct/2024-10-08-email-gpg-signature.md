---
layout: micro
title:  "[Preview] Manually Verifying an Email Signature"
date: 2024-10-08
categories: [micro, gpg, signing]
permalink: micro/2024/10/:title
---

I noticed that the neocities community love using protonmail and some even share their public key to enable full encryption communication. 
While I care about cyber security more than the average human, I do not care enough to start requiring others to start encrypting their 
email and sign their messages so that I can verify the authenticity of the messages I receieve.

Out of curiosity, I decided to see how one would manually verify the signature of an email to ensure that the email has not been tampered with 
and comes from the person who it claims to be. I won't go into how digital signatures work as those details will be posted shortly after at 
my [blog](https://zakuarbor.github.io/blog/signature-verification/).

1. Import Alice's public key:
```
$ gpg --import publickey-alice@proton.me.asc 
gpg: key <redacted>: public key "alice@proton.me <alice@proton.me>" imported
gpg: Total number processed: 1
gpg:               imported: 1
```

2. Download the email `.eml` file and the signature
```
$ ls signature.asc 'GPG Signing test.eml'
'GPG Signing test.eml'   signature.asc
```

3. Extract the message to verify from `.eml` file

    This is where things get difficult. The downloaded email `*.eml` has a lots of unnedded information that needs to be discarded. 
    I highly recommend that you make a copy of the email file because it does take a while to get used to.

    The content of the message starts after you see the following header (the hash will differ):
    ```
    This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
    --------7005887d7abcdefgbe09e18825fd164103abcdefgf8c40b59382649cd69bc70a
    ```

    So for instance, let's look at the following file:
    ```
    MIME-Version: 1.0
    Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------3141887d7abcdefgbe09e18825fd164103abcdefgf8c40b59382649cd69b31415"; charset=utf-8

    This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
    --------3141887d7abcdefgbe09e18825fd164103abcdefgf8c40b59382649cd69b31415
    Content-Type: multipart/mixed;boundary=---------------------ff35159c3ebf11234dd954191b3141592
    ```

    Then the first line of the signed message is:
    ```
    Content-Type: multipart/mixed;boundary=---------------------ff35159c3ebf11234dd954191b3141592
    ```

    Where the signed message ends is a scene of confusion. On the internet, there are many that says you to put everything between the first boundary and the second boundary into 
    a new file. The boundary they are referring to is the line after `This is an OpenPGP/MIME signed message (RFC 4880 and 3156)` which has the form `----<hash>`.

    ```
    --------3141887d7abcdefgbe09e18825fd164103abcdefgf8c40b59382649cd69b31415

    //email content

    --------3141887d7abcdefgbe09e18825fd164103abcdefgf8c40b59382649cd69b31415
    ```

    Despite my many attempts, I had no success till I realized you have to delete all trailing new lines. One thing I notice is that the hash on the first line of the signed message
    is also the last line in the signed message.


    ```
    Content-Type: multipart/mixed;boundary=---------------------ff35159c3ebf11234dd954191b3141592
    ```
    <p class = "caption"> The first line of the signed file</p>


    The hash on the first line of the signed message is: `ff35159c3ebf11234dd954191b3141592` so our file should also end with this hash.


    If our message looks something like this:
    ```
    MIME-Version: 1.0
    Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------3141887d7abcdefgbe09e18825fd164103abcdefgf8c40b59382649cd69b31415"; charset=utf-8

    This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
    --------3141887d7abcdefgbe09e18825fd164103abcdefgf8c40b59382649cd69b31415
    Content-Type: multipart/mixed;boundary=---------------------ff35159c3ebf11234dd954191b3141592

    ...

    -----------------------ff35159c3ebf11234dd954191b3141592
    Content-Type: application/pgp-keys; filename="publickey - alice@proton.me - <redacted>.asc"; name="publickey-alice@proton.me.asc"
    Content-Transfer-Encoding: base64
    Content-Disposition: attachment; filename="publickey-alice@proton.me.asc"; name="publickey - alice@proton.me - <redacted>.asc"

    ABCDEF0x4ZjZkeGxSL0xUABCDEFmltotlUR0ABCDEFWaABCDEFE9PQP9ABCDEFAABCDEFtLUVORCBABCED
    ABCDEFEABCDEFFWSBCTE9DSy0tLABCDE==
    -----------------------ff35159c3ebf11234dd954191b3141592--

    --------3141887d7abcdefgbe09e18825fd164103abcdefgf8c40b59382649cd69b31415
    ```

    Then the signed message should be

    ```
    Content-Type: multipart/mixed;boundary=---------------------ff35159c3ebf11234dd954191b3141592

    ...

    -----------------------ff35159c3ebf11234dd954191b3141592

    ...

    -----------------------ff35159c3ebf11234dd954191b3141592
    Content-Type: application/pgp-keys; filename="publickey - alice@proton.me - <redacted>.asc"; name="publickey-alice@proton.me.asc"
    Content-Transfer-Encoding: base64
    Content-Disposition: attachment; filename="publickey-alice@proton.me.asc"; name="publickey - alice@proton.me - <redacted>.asc"

    ABCDEF0x4ZjZkeGxSL0xUABCDEFmltotlUR0ABCDEFWaABCDEFE9PQP9ABCDEFAABCDEFtLUVORCBABCED
    ABCDEFEABCDEFFWSBCTE9DSy0tLABCDE==
    -----------------------ff35159c3ebf11234dd954191b3141592--
    ```

4. Verify the signature: `gpg --verify signature.asc message.txt`

    ```
    $ gpg --verify signature.asc message.txt 
    gpg: Signature made Mon 07 Oct 2024 11:29:48 PM EDT
    gpg:                using EDDSA key <redacted>
    gpg: Good signature from "alice@proton.me <alice@proton.me>" [unknown]
    gpg: WARNING: This key is not certified with a trusted signature!
    gpg:          There is no indication that the signature belongs to the owner.
    Primary key fingerprint: <redacted>
    ```

In practice, no one verifies the digital signatures of emails manually. Any sane individual will utilize any email client that would automate the verification process for 
them. This was a quick preview of a [blog post](https://zakuarbor.github.io/blog/signature-verification/) I will be writing in the next few days that will go into email signatures in more details 
with better explanations and diagrams.
