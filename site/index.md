Public Keys
===========

#### My [main key](</AE305ED4/>)

This key should be used for all traffic.

```
pub   4096R/0x9DEA9987AE305ED4 2015-09-16 [expires: 2020-09-14]
      Key fingerprint = D785 1C98 4AEA C232 30C0  2529 9DEA 9987 AE30 5ED4
uid                 [ultimate] Kyle Isom <kyle@imap.cc>
uid                 [ultimate] Kyle Isom <isomk@kyleisom.net>
uid                 [ultimate] Kyle Isom <kyle@tyrfingr.is>
uid                 [ultimate] Kyle Isom <kyle@metacircular.net>
uid                 [ultimate] Kyle Isom <coder@kyleisom.net>
sub   4096R/0xB40E03E26F9AB6AE 2015-09-16 [expires: 2020-09-14]
      Key fingerprint = 775A 3B96 6E12 B570 F54A  44BC B40E 03E2 6F9A B6AE
```

#### My [code signing key](/4401FC2C/)

This key is used to sign git commits and releases. It should only be
used to verify signatures.

```
pub   4096R/0x1F8B07B64401FC2C 2015-09-16 [expires: 2020-09-14]
      Key fingerprint = FC8D FC52 600A 5CD1 A167  8F49 1F8B 07B6 4401 FC2C
uid                 [ultimate] Kyle Isom (code signing key) <coder@kyleisom.net>
uid                 [ultimate] Kyle Isom (code signing key) <kyle@metacircular.net>
uid                 [ultimate] Kyle Isom (code signing key) <kyle@imap.cc>
uid                 [ultimate] Kyle Isom (code signing key) <kyle@tyrfingr.is>
uid                 [ultimate] Kyle Isom (code signing key) <isomk@kyleisom.net>
sub   4096R/0x2D85411D695A3395 2015-09-16 [expires: 2020-09-14]
      Key fingerprint = 5F54 A231 9B46 4450 8F61  4353 2D85 411D 695A 3395
```

#### My [previous key](/107DAD37/)

This key expires at the end of 2015.

```
pub   4096R/0xEE4FBA85107DAD37 2013-12-21 [expires: 2015-12-21]
      Key fingerprint = 3B0C 4DE7 D165 8D1A 5FAE  C120 EE4F BA85 107D AD37
uid                 [ultimate] Kyle Isom <kyle@tyrfingr.is>
sub   4096R/0x1641A4A90EAC766F 2013-12-21 [expires: 2015-12-21]
      Key fingerprint = 14F7 8D7B 9EF4 CC73 24A1  71E0 1641 A4A9 0EAC 766F
```

#### My [identity key](/1633F1C4/)

This is the owner of the previous two keys, and will be used to issue
revocations and sign new keys. It is kept offline, and messages to
this key will not be read. This key should only be used to verify the
provenance of keys.

```
pub   4096R/0xF23042781633F1C4 2015-09-16 [expires: 2035-09-11]
      Key fingerprint = 7645 3DA9 A6E9 0715 C06F  2252 F230 4278 1633 F1C4
uid                 [ultimate] Kyle Isom (identity key) <isomk@kyleisom.net>
sub   4096R/0xC34316210F42954F 2015-09-16 [expires: 2035-09-11]
      Key fingerprint = 2637 81CC 63DB 3383 DC72  0647 C343 1621 0F42 954F
```
