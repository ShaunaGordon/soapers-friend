# Soaper's Friend

Right now, this is a sample project to demonstrate my skills. Eventually, I hope this will become an actual, useful application.

## Application Goals

The goal of this as an application is to provide a system for soap makers to record their recipes (with built in saponification calculators), track batches and inventory (both supplies and finished items), calculate cost of goods and wholesale/retail prices, and create text to export to a label maker. In short, it should be a central dashboard for professional soap makers.

## Technical Information

* Language: Ruby 2.5
* Framework: Rails
* Virtualization: Docker with Kubernetes orchestration

## To Run Locally

*Requirements*

* Kubernetes
* Minikube/kubectl
* Docker
* Hypervisor of choice (I use VirtualBox and KVM)
* Secret file in parent folder of project, set up [per instructions here](https://www.engineyard.com/blog/kubernetes-tutorial-running-a-rails-app-in-kubernetes)

Once those are set up, running `bin/start` should set everything up and load the page your default browser. To tear everything down, run `bin/stop`.
