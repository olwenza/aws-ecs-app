# aws-ecs-app

# 🚀 Project Title

AWS Elastic Container Services app

# 📝 Overview

A web app hosted in AWS ECS

# 🚀 Run application

1. Download source code

```
get clone https://github.com/olwenza/aws-ecs-app.git
```

2. Ready project

```
unzip aws-ecs-app.git .
cd aws-ecs-app
cd iac/terraform
```

3. Initialize terraform (Do steps 6 to 8 if you don't already have a ssh key)

```
terraform init
```

4. Plan terraform

```
terraform plan
```

5. Run terraform

```
terraform apply
```

6. Create ssh key for ec2 access

```
aws ec2 create-key-pair \
  --key-name aws-ec2-key \
  --query 'KeyMaterial' \
  --output text > aws-ec2-key.pem
```

7. Lock down key permission

```
chmod 400 aws-ec2-key.pem
```

8. Verify key was created and is there

```
aws ec2 describe-key-pairs --query "KeyPairs[].KeyName"

```

9. Use the following command to ssh into a ec2 instance

```
ssh -i aws-ec2-key.pem ec2-user@<PUBLIC_IP>
```

# ⏬ Download

Use the follow git command to clone the project

```
git clone https://github.com/olwenza/aws-ecs-app.git
```

# ✏️ Authors

Contributors names and contact info

Ivan Augustino
[@ivanaugustino](https://www.linkedin.com/in/ivanaugustino/)

# 📄 License

This project is licensed under the MIT License.
