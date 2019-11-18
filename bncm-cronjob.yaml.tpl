apiVersion: batch/v1beta1
kind: CronJob
metadata:
  name: nisra-mover
spec:
  schedule: "*/5 * * * *"
  successfulJobsHistoryLimit: 5
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: nisra-mover-container
            image: "eu.gcr.io/blaisepoc/blaise-nisra-case-mover-sftp:COMMIT_SHA"
            volumeMounts:
            - name: nisra-transfer
              mountPath: /mnt/data
            env:
              - name: SFTP_HOST
                valueFrom:
                  secretKeyRef:
                    name: nisrasftp
                    key: SFTP_HOST
              - name: SFTP_USERNAME
                valueFrom:
                  secretKeyRef:
                    name: nisrasftp
                    key: SFTP_USERNAME
              - name: SFTP_PASSWORD
                valueFrom:
                  secretKeyRef:
                    name: nisrasftp
                    key: SFTP_PASSWORD
              - name: SFTP_PORT
                valueForm:
                valueFrom:
                  secretKeyRef:
                    name: nisrasftp
                    key: SFTP_PORT
          volumes:
          - name: nisra-transfer
          restartPolicy: OnFailure