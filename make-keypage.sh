#!/bin/sh

if [ -z $1 ]
then
	exit 1
fi

KEYID=$1
SHORTID=

FINGERPRINT="$(gpg --fingerprint $KEYID)"
TOPLINE="$(echo $FINGERPRINT | awk '/^pub/{print $2}')"
SHORTID="$(echo $KEYID | sed -e 's/0x........//')"
PUBLIC="$(gpg -a --export $KEYID)"

[ -d site/$SHORTID ] || mkdir site/$SHORTID
gpg -a -o site/$SHORTID/$SHORTID.asc --export $KEYID

cat  > site/$SHORTID/index.md << EOF
## $TOPLINE

[ASCII-armoured key](/$SHORTID/$SHORTID.asc)

\`\`\`
$FINGERPRINT

$PUBLIC
\`\`\`

EOF
