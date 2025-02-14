# k8s-tools

## buffer

Circluar butter tool. See buufer -h for usage.

## hl.pl

A simple perl script to highlight Pending and pods and pods where all container have not started.
```
kubectl get pods -Aw | ./hl.pl
```

## kubectl-hl

### Installation

* kubectl-hl must be on PATH
* pip install kubernetes
* pip install prettytable

### Usage:
```
   kubectl hl [--context <kubeconfi context>] [-c|-C|-s|-S] [--no-borders] [--no-headers] [-A|-n <namespace>[,<namespace>...] [-l <label selection>]
   kubectl hl [-G <nodegroup> ] [-V <kubernetes version> ] 
   kubectl hl [-N <node>[,<node>]...] 
```
#### Options

`-c`  List all containers in selected pods.

`-C`  List failing containers in selected pods.

`-s`  List all status transitions in selected pods.

`-S`  List failing status transitions in selected pods.

`-G`  Filter by EKS Nodegroup. Incompatible with `-N`.

`-V`  Filter by Kubernetes Node version. Ignored with `-N`.

`-N`  Filter by comma separated list of nodes. Incompatible with `-G`.

`--context`, `-A`, `-n`, `-l` as standard.

Format options: `--no-borders`, `--double-borders`(`-D`), `--markdown`(`-M`) and `--no-headers`.

When none of `-c`, `-C`, `-s` or `-S` options are given the output displays the
status of a pod's containers: 

`R/I`    Number of ready/total init containers.
`S/R/C`  Number of started/ready/total standard containers (non-init)
`E`      An `*` indicates a pod in not ready or in startup. 

