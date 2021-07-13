# alpine-debug

Pre-built image for common debugging tasks, to use just run something like:
```bash
kubectl run alpine-debug --image=zmazay/alpine-debug --restart=Never --namespace=default -i --tty --attach --rm
```

or for using quai.io mirror:
```bash
kubectl run alpine-debug --image=quay.io/mazay/alpine-debug --restart=Never --namespace=default -i --tty --attach --rm
```
