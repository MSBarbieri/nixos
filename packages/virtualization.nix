{pkgs, ...}:
with pkgs; [
  lazydocker
  k9s
  kubectl
  kubectx
  kustomize
  istioctl
  kind
  helm
]
