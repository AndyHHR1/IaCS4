# Image Processor

Sistema de procesamiento de imágenes con AWS Lambda, S3, SQS y API Gateway.

## Arquitectura

- **lb-upload**: Lambda que recibe imágenes vía API Gateway y las almacena en S3
- **lb-crop**: Lambda disparada por SQS que procesa imágenes (resize + máscara circular)
- **S3**: Almacenamiento con prefijos `uploads/` y `processed/`
- **SQS**: Cola para encolar eventos de S3

## Despliegue

### Entorno DEV

```bash
cd terraform
terraform init
terraform workspace new dev
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars" -auto-approve
```

### Entorno QA

```bash
cd terraform
terraform workspace new qa
terraform plan -var-file="qa.tfvars"
terraform apply -var-file="qa.tfvars" -auto-approve
```

### Entorno PROD

```bash
cd terraform
terraform workspace new prod
terraform plan -var-file="prod.tfvars"
terraform apply -var-file="prod.tfvars" -auto-approve
```

## Uso

Obtén la URL de la API desde la salida de Terraform:

```bash
curl -X POST <TU_API_URL_AQUI> \
  -H "Content-Type: image/jpeg" \
  --data-binary "@/ruta/a/tu/foto.jpg"
```

## Limpieza

```bash
terraform destroy -var-file="<entorno>.tfvars" -auto-approve
```

Reemplaza `<entorno>` por `dev`, `qa` o `prod`.