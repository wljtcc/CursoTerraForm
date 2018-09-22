# Terraform Curso Udemy
Notas sobre o curso do terraform udemy com Oracle Cloud

### Terraform init

Executar o terraform init

```
terraform init
```

resultado:

```
Initializing provider plugins...
- Checking for available provider plugins on https://releases.hashicorp.com...
- Downloading plugin for provider "opc" (1.2.1)...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.opc: version = "~> 1.2"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

Executar o terraform plan

```
terraform plan
```

Resultado:

```
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  + opc_compute_ip_reservation.production
      id:          <computed>
      ip:          <computed>
      name:        <computed>
      parent_pool: "/oracle/public/ippool"
      permanent:   "true"
      used:        <computed>


Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

A linha abaixo nunca deve ser alterada.

```
resource "opc_compute_ip_reservation" "production" 
```
Executar o comando terraform apply

```
terraform apply
```

Resultado:

```
An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  + opc_compute_ip_reservation.production
      id:          <computed>
      ip:          <computed>
      name:        <computed>
      parent_pool: "/oracle/public/ippool"
      permanent:   "true"
      used:        <computed>


Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

opc_compute_ip_reservation.production: Creating...
  ip:          "" => "<computed>"
  name:        "" => "<computed>"
  parent_pool: "" => "/oracle/public/ippool"
  permanent:   "" => "true"
  used:        "" => "<computed>"
opc_compute_ip_reservation.production: Creation complete after 2s (ID: 22c8461b-8484-4008-8dbd-a001f53c2baa)

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```