# Set Cypress environment variables for local development environment
# Intended use:
#   $ cd [ROOT]
#   $ source hacks/cypress_env_local.sh
#   $ yarn cypress-open --project=...[CYPRESS_PROJECT]...

# CLEANUP
unset ${!CYPRESS@}

# Minikube
export CYPRESS_API_BASE_URL=http://10.19.130.2:6000
export CYPRESS_BASE_URL=http://localhost:3000
export CYPRESS_SSH_PUB_KEY=$(cat ~/.ssh/id_rsa.pub)

export CYPRESS_CLUSTER_NAME=test-infra-cluster-assisted-installer
export CYPRESS_CLUSTER_BASE_DOMAIN='redhat.com'
export CYPRESS_CLUSTER_HOSTNAME_MASTER_PREFIX=test-infra-cluster-assisted-installer-master
export CYPRESS_CLUSTER_HOSTNAME_WORKER_PREFIX=test-infra-cluster-assisted-installer-worker
export CYPRESS_PULL_SECRET=$(cat ~/pull-secret)
export CYPRESS_ISO_PATTERN="~/Downloads/cluster-*-discovery.iso"
export CYPRESS_OPENSHIFT_VERSION='OpenShift 4.6.8'
#export CYPRESS_OCM_COOKIE_NAME=cs_jwt
#export CYPRESS_OCM_TOKEN_DEST="~/Downloads/token"

# POST-DEPLOYMENT VARS
export CYPRESS_API_VIP=192.168.126.10
export CYPRESS_INGRESS_VIP=192.168.126.11
export CYPRESS_NUM_MASTERS=3
export CYPRESS_NUM_WORKERS=0

# Print all
if [ x${SKIP_ENV_OUTPUT} != xyes  ]; then
  env | grep CYPRESS_ | sort
fi

