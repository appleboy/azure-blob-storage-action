# azure-blob-storage-action

azure blob storage action for set expiration date for blob.

## Inputs

* `account_name` - Azure Blob Storage Account Name
* `account_key` - Azure Blob Storage Account Key
* `container_name` - Azure Blob Storage Container Name
* `blob_name` - Azure Blob Storage Blob Name
* `duration` - SAS Token Duration (default: 1 hour)

## Example usage

```yaml
uses: actions/azure-blob-storage-action@v1.0.0
with:
  account_name: account_name
  account_key: account_key
  container_name: container_name
  blob_name: blob_name
  duration: 1h
```
