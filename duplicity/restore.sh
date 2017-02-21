#!/bin/sh -xe
set -x
set -e

CONNECTION_OPTIONS="--use-agent \
          --verbosity $LOG_LEVEL \
          --num-retries 3 \
          --encrypt-key $FINGERPRINT \
          --log-file /dev/stdout \
          --archive-dir /cache/archive \
          --tempdir /cache/tmp \
          --ssh-options=-oIdentityFile=/ssh_keys/backup \
          --gpg-options --passphrase=$PASSPHRASE \
          --gpg-options --no-tty \
          --gpg-options --batch \
          --gpg-options --pinentry-mode=loopback"

# Import and trust the GPG Keys
gpg --passphrase $PASSPHRASE --no-tty --batch --import /gpg_keys/*.priv.asc
echo "$FINGERPRINT:6:" | gpg --import-ownertrust

mkdir -p /cache/archive 

# Restore the Backup
duplicity restore \
    $CONNECTION_OPTIONS \
    "$BACKUP_STORAGE" /data/
