# Docker backup (duplicity)

This is a docker container is used create backups. The backups are made with duplicity and use PGP encryption by default. It was tested with scp and google storage as a backend.

## Requirements

To use this container you need to have `docker` and `docker-compose` installed. For more information visit their [documentation](https://docs.docker.com/).

## Usage:

This container can be configured completly by editing the config.env. Maybe you may have to also edit the `backup.yml` or `restore.yml` file.

### PGP
For PGP you need the directory `gpg_keys` in this directory. This folder should contain a keypair with the private key named `backup.priv.asc` and the public key named `backup.pub.key`.

You also need to put the passphrase in the config.env on the `PASSPHRASE` variable and the Fingerprint of the key in the `FINGERPRINT` variable. For more information you could visit the [Arch Wiki](https://wiki.archlinux.org/index.php/GnuPG)

### Making a backup

In theory you now only need to set the `BACKUP_STORAGE` variable and you could get running. This should point to the location where you want your backup stored. You need to run the following command in the root-directory of this project.

```shell
docker-compose -f backup.yml build
docker-compose -f backup.yml up
docker-compose -f backup.yml down
```

This creates a backup in the BACKUP_STORAGE location encrypted with your PGP-Key.

#### Configuring what to backup

By default this container will take `/` as a volume under `/data`. If you don't want this behaviour, please change the first volume in the `backup.yml` to something like `- /what/to/backup:/data/`.

You can also exclude files from being backuped. To achieve this, please configure the `EXCLUDE_DIRS` variable with as many `--exclude /data/dir/to/exclude` as you like. Please remember that everything lies under `/data` in the container.

#### SCP-Backend

To use SCP as backend you need a ssh-keypair which should be configured without a passphrase. This muss be named backup and should be put into a directory named `ssh_keys`. This ssh-key needs to be put into the `authorized_keys` file on the server. For more information you could again visit the [Arch Wiki](https://wiki.archlinux.org/index.php/SSH_keys).

Then you should configure the `BACKUP_STORAGE` as follows `scp://user@server:port//path/to/backup/location`. This should do the trick.

#### Google Storage Backup

I haven't used this yet actually, so I will be documenting when I get to it.

### Restoring a backup

You can restore the backup normally with duplicity and your PGP-Keys. Buuut you can also use a docker-container. To do so, with everything configured like before run:

```shell
docker-compose -f restore.yml build
docker-compose -f restore.yml up
docker-compose -f restore.yml down
```

This should put everything in the first volume defined in the `restore.yml` like `- /dir/to/restore/to:/data`. 

## Further information

Here I will be documenting some decisions I made when configuring the backup etc.
