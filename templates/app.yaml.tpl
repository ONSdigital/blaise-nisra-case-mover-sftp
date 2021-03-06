service: nisra-case-mover
runtime: python37

env_variables:
  SFTP_PORT: 22
  SFTP_HOST: _SFTP_HOST
  SFTP_USERNAME: _SFTP_USERNAME
  SFTP_PASSWORD: _SFTP_PASSWORD
  INSTRUMENT_SOURCE_PATH: ''
  SURVEY_SOURCE_PATH: _SURVEY_SOURCE_PATH
  INSTRUMENT_DESTINATION_PATH: _INSTRUMENT_DESTINATION_PATH
  NISRA_BUCKET_NAME: _NISRA_BUCKET_NAME

vpc_access_connector:
  name: projects/_PROJECT_ID/locations/europe-west2/connectors/vpcconnect

basic_scaling:
  idle_timeout: 60s
  max_instances: 1
