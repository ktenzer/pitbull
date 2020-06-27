# Pitbull

Example of a k8s admission controller written in Ansible. The operator listens to the ServiceAccount API.
It maintains an allowed whitelist of service accounts in the roles/vars/main.yaml. Any service account that
exists on startup or gets created that doesn't match whitelist will be deleted.

The purpose is to only allow administrators to tightly control service account creation.

This pattern can be applied to any k8s APIs.

## Installation
The operator can be deployed cluster-wide or namespaced. Be very careful if you deploy it cluster-wide as any
SAs not in whitelist will be deleted upon startup.

For a cluster wide deployment use yaml files under deploy/cluster.

For a namespace wide deployment use yaml files under deploy/namespace.

```$ kubectl create -f deploy/namespace/service_account.yaml```
 
```$ kubectl create -f deploy/namespace/role.yaml```

```$ kubectl create -f deploy/namespace/role_binding.yaml```

```$ kubectl create -f deploy/namespace/operator.yaml```
