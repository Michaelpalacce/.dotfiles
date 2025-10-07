#!/usr/bin/env bash

# Dev
brew install mariadb go golangci-lint kubebuilder

brew tap hashicorp/tap
brew install hashicorp/tap/vault

# Ginkgo for tests
go install github.com/onsi/ginkgo/v2/ginkgo