# azure-blob-storage-action

azure blob storage action for set expiration date for blob.

## Inputs

* `account_name` - Azure Blob Storage Account Name
* `account_key` - Azure Blob Storage Account Key
* `container_name` - Azure Blob Storage Container Name
* `blob_name` - Azure Blob Storage Blob Name
* `duration` - SAS Token Duration (default: 1 hour)

## Outputs

* `blob_url` - Azure Blob Storage Blob URL
* `expire_at` - Blob Expiration Date
* `expire_at_unix` - Blob Expiration Date (Unix Timestamp)

## Example usage

```yaml
uses: actions/azure-blob-storage-action@v1.1.0
id: azure
with:
  account_name: account_name
  account_key: account_key
  container_name: container_name
  blob_name: blob_name
  duration: 1h

run: |
  echo "Blob URL: ${{ steps.azure.outputs.blob_url }}"
  echo "Blob Expiration Date: ${{ steps.azure.outputs.expire_at }}"
  echo "Blob Expiration Date (Unix Timestamp): ${{ steps.azure.outputs.expire_at_unix }}"
```
