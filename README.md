# thumbor-consul

- Thumbor containers managed by supervisor
- Uses thumbor_aws s3_loader with s3_result_storage
- Number of Thumbor processes: 4
- thumbor.conf populated by Consul
- Keys needed in Consul:
  - THUMBOR_SECURITY_KEY
  - THUMBOR_ALLOWED_SOURCES
  - THUMBOR_RESULT_STORAGE_BUCKET
  - THUMBOR_S3_LOADER_BUCKET
  - THUMBOR_STORAGE_BUCKET
  - THUMBOR_AWS_ACCESS_KEY
  - THUMBOR_AWS_SECRET_KEY
