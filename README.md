# Soaper's Friend

Right now, this is a sample project to demonstrate my skills. Eventually, I hope this will become an actual, useful application.

## Goals And Features As A Portfolio Project

Right now, this is primarily a portfolio project, allowing me to demonstrate my skills as a developer in a real-world-applicable system. As such, it is a fair bit more comment-heavy than I normally would do.

While I prefer to err on the side of "more comments," my usual code tends to be somewhat light on them (I strive for code that is easy to understand the "what" and prefer to save comments for explanations on "why"). However, as this is also serving as a portfolio item, and because it's a rather niche product, I've chosen to write a fair bit more about what's going on, in order to illustrate more of my thought process and the otherwise-unwritten business needs. Most of these types of comments can be found in the test suites, which can serve as a guide to understanding the needs and process of the project.

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
