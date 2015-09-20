KEY MASTERING GUIDE
===================

The following is a set of procedures for generating the new GnuPG keys.

Preparation
-----------

These steps should only need to be done once or periodically.

### Keymaster Armoury

Prepare a USB armoury (alternative VM, ensuring it has a good source of
randomness availale) whose primary purpose is to keep the keys separate
from the host (e.g. to prevent keys leaking in from outside).

-   Install:
    -   gnupg2
    -   haveged
    -   openssh-server
-   Create two users:
    -   keymaster: this holds the identity key
    -   kyle: this is the standard key generation

### The identity key

This key is a long-term (20 year) key that will sign new keys as needed.
It is kept offline, and **only** used for key issuance and continuity.

The current identity key:

    pub   4096R/0x29DA9B3C7DA6FA5D 2015-09-15 [expires: 2035-09-10]
      Key fingerprint = BC57 7F65 F531 54A3 9FD8  AE8F 29DA 9B3C 7DA6 FA5D
    uid                 [ultimate] Kyle Isom (long-term identity key) <isomk@kyleisom.net>
    sub   4096R/0x274901B82FDC081C 2015-09-15 [expires: 2035-09-10]

This key should be imported into `kyle`'s keyring, trusted fully, and
set as the revocation key for the remainder of the keys.

### Generating Keys

The first key to generate is the routine traffic key. Generate the key,
add all UIDs, and set the identity key as the revoker. Follow the checklist
in Appendix C.


Appendix A: Default gpg.conf
----------------------------

This is the [standard riseup gpg.conf](https://we.riseup.net/riseuplabs+paow/openpgp-best-practices):

    default-key CHANGEME
    
    # Riseup PGP best practices.
    
    # when outputting certificates, view user IDs distinctly from keys:
    fixed-list-mode
    
    # short-keyids are trivially spoofed; it's easy to create a long-keyid
    # collision; if you care about strong key identifiers, you always want
    # to see the fingerprint:
    keyid-format 0xlong
    with-fingerprint
    
    # when multiple digests are supported by all recipients, choose the
    # strongest one:
    personal-digest-preferences SHA512 SHA384 SHA256
    
    # preferences chosen for new keys should prioritize stronger algorithms: 
    default-preference-list SHA512 SHA384 SHA256 SHA224 AES256 AES192 AES ZLIB ZIP Uncompressed
    
    # If you use a graphical environment (and even if you don't) you should be using an agent:
    # (similar arguments as  https://www.debian-administration.org/users/dkg/weblog/64)
    use-agent
    
    # You should always know at a glance which User IDs gpg thinks are legitimately bound to the keys in your keyring:
    verify-options show-uid-validity
    list-options show-uid-validity
    
    # include an unambiguous indicator of which key made a signature:
    # (see http://thread.gmane.org/gmane.mail.notmuch.general/3721/focus=7234)
    sig-notation issuer-fpr@notations.openpgp.fifthhorseman.net=%g
    
    # when making an OpenPGP certification, use a stronger digest than the default SHA1:
    cert-digest-algo SHA512
    
    # Use HKPS SKS server over to:
    #   torify gpg --recv-keys ...
    # Getting the cert:
    #   curl -LO https://sks-keyservers.net/sks-keyservers.netCA.pem
    #   SHA256:    0666ee848e03a48f3ea7bb008dbe9d63dfde280af82fb4412a04bf4e24cab36b
    #   SHA512256: b8d043e869ca6a9857300ea9955380a7145b577a3c11e12890677a8ea7a8b5be
    keyserver hkps://hkps.pool.sks-keyservers.net
    keyserver-options ca-cert-file=/etc/ssl/certs/sks-keyservers.netCA.pem
    keyserver-options no-honor-keyserver-url


Appendix B: Obtaining the HKPS SKS server certificate
-----------------------------------------------------

The site is sometimes offline. If it is, obtain the certificate
[here](/files/sks-keyservers.netCA.pem).


Appendix C: Set git codesigning key id
--------------------------------------

First, set the signing key with

     git config --global user.signingKey KEYID

Alternatively, to specify a particular key:

    git commit --gpg-sign=KEYID

There are two options for signing commits:

1. Sign all commits: git config --global commit.gpgsign=1
2. Sign a single commit with `git commit -S`.

The first isn't necessarily the best option; signing a tag provides
a signature for all the commits underneath as these form part of
the tree. If the first option is chosen, a commit can be made without
a signature by using the --no-gpg-sign flag.


Appendix D: Key generation checklist
------------------------------------

This should be followed each key rollover:

    === Key generation ===

    --- Identity key ---
    NOTE: this probably doesn't need to be generated.
    NOTE: this should be generated in the `keymaster` user.
    [ ] Identity key generation required?
    [ ] Identity key generated
    [ ] Revocation certificate generated

    NOTE: the following keys should be generated in the `kyle` user.

    --- Traffic Key ---
    [ ] Key generated
    [ ] All UIDs added:
        [ ] UID: kyle@imap.cc
        [ ] UID: kyle@tyrfingr.is
        [ ] UID: kyle@metacircular.net
        [ ] UID: coder@kyleisom.net
        [ ] UID: isomk@kyleisom.net
    [ ] Identity key set as revoker
    [ ] Revocation certificate generated

    --- Code signing key ---
    [ ] Key generated
    [ ] All UIDs added:
        [ ] UID: kyle@imap.cc
        [ ] UID: kyle@tyrfingr.is
        [ ] UID: kyle@metacircular.net
        [ ] UID: coder@kyleisom.net
        [ ] UID: isomk@kyleisom.net
    [ ] Identity key set as revoker
    [ ] Revocation certificate generated

    --- Operations ---
    [ ] Key generated
    [ ] All UIDs added:
        [ ] UID: sadm@kyleisom.net
    [ ] Identity key set as revoker
    [ ] Revocation certificate generated

    --- Backups ---
    [ ] Key generated
    [ ] All UIDs added:
        [ ] UID: sadm@kyleisom.net
    [ ] Identity key set as revoker
    [ ] Revocation certificate generated

    === Provenance ===

    This needs to be done from `keymaster`.

    [ ] Sign traffic key.
    [ ] Sign codesigning key.
    [ ] Sign ops key.
    [ ] Sign backup key.

    === Packaging ===

    --- keymaster ---
    [ ] Tarball keymaster keyring, timestamp

    --- kyle ---
    [ ] Export keys (both private and public).
    [ ] Deploy public keys to keys.kyleisom.net.
    [ ] Tarball keyring, timestamp.
    [ ] Issue revocations as desired.
