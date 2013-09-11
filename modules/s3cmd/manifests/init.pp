class s3cmd ($s3cmdAccessKey, $s3cmdSecretKey) {
  include s3cmd::packages
  include s3cmd::config
}