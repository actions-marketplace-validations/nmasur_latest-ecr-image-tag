# Latest ECR Image Hash Action

This action fetches the image tagged "latest" in an ECR repository and prints its *other* tag(s). For example, if you also tag your image with a version or commit hash, that will be printed.

This is useful for build pipelines where you need the latest commit but you want to use the exact hash instead of just pulling "latest". One example is for AWS ECS with Terraform, which will only update the task if the tag has changed.

## Inputs

### `AWS_ACCESS_KEY_ID`

**Required** An IAM key pair with read access to ECR.

### `AWS_SECRET_ACCESS_KEY`

**Required** An IAM key pair with read access to ECR.

### `AWS_REGION`

**Required** The AWS region name containing the ECR repo, e.g. `us-east-1`.

### `REPOSITORY_NAME`

**Required** The name of the ECR repository (just the basic name, not the full URI).

## Outputs

### `hash`

The output tag (usually a hash).

## Example usage

```
uses: actions/latest-ecr-image-tag@v1
with:
    AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
    AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
    AWS_REGION: us-east-1
    REPOSITORY_NAME: my-example-repo
```
