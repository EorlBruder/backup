#!/bin/sh -xe
set -x
set -e

CONNECTION_OPTIONS="--use-agent \
          --verbosity $LOG_LEVEL \
          --num-retries 3 \
          --encrypt-key $FINGERPRINT \
          --log-file /dev/stdout \
          --archive-dir /cache/archive \
          --ssh-options=-oIdentityFile=/ssh_keys/backup \
          --gpg-options --passphrase=$PASSPHRASE \
          --gpg-options --no-tty \
          --gpg-options --batch \
          --gpg-options --pinentry-mode=loopback"

# Import and trust the GPG Keys
gpg --passphrase $PASSPHRASE --no-tty --batch --import /gpg_keys/*.priv.asc
echo "$FINGERPRINT:6:" | gpg --import-ownertrust

mkdir -p /cache/archive

# Make the actual backup
duplicity --asynchronous-upload \
          --volsize 250 \
          --full-if-older-than 1M \
          $CONNECTION_OPTIONS \
	        $EXCLUDE_DIRS \
	        /data/ "$BACKUP_STORAGE"

# Clean up broken backups
duplicity cleanup $CONNECTION_OPTIONS \
          "$BACKUP_STORAGE"

# Clean up old backups
duplicity remove-all-but-n-full 1 $CONNECTION_OPTIONS \
          "$BACKUP_STORAGE"
