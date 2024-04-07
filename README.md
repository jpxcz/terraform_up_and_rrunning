
## Database User Managment
```sh
# On the mysql folder
$ export TF_VAR_db_username="(YOUR_DB_USERNAME)"
$ export TF_VAR_db_password="(YOUR_DB_PASSWORD)"

$ terraform init
$ terraform apply
```

## Encrypting Sensitive Data
```sh
$ cd aws_kms
$ ./encrypt.sh \
  alias/kms-cmk-example \
  us-west-2 \
  db-creds.yml \
  db-creds.yml.encrypted
```
