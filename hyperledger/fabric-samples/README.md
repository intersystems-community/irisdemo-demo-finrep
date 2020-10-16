[//]: # "SPDX-License-Identifier: CC-BY-4.0"

# Intersystems IRIS + Hyperledger Fabric

Our demo is using the Hyperledger Test Network to quickly get started working with Hyperledger Fabric, and explore how to build applications on top of IRIS that can interact with blockchain networks using the Fabric SDKs. To learn more about Hyperledger Fabric, visit the [Fabric documentation](https://hyperledger-fabric.readthedocs.io/en/latest).

## Getting started with the Fabric samples

The demo is designed to be simple and easy to run. Int the root directory of the project just run the run_with_hyperledger.sh script. This scrpit will spin up a hyperledger network, an associated hyperledger blockchain explorer, and an instance of InterSystems IRIS. When you are finished running your demo simply run the stop_demo_with_hyperledger.sh script.

## Test network

The [Fabric test network](test-network) in the samples repository provides a Docker Compose based test network with two
Organization peers and an ordering service node. You can use it on your local machine to run the samples listed deploy and test your own Fabric chaincodes and applications. To get started, see
the [test network tutorial](https://hyperledger-fabric.readthedocs.io/en/latest/test_network.html).

## Provided Asset transfer sample

The **Mortgage Reporting Asset Comtract** sample is being used to show how to make IRIS interact with a Fabric network using the Fabric SDKs.

|  **Smart Contract** | **Description** | **Tutorial** | **Smart contract languages** | **Application languages** |
| -----------|------------------------------|----------|---------|---------|
| [Mortgage-Reporting](mortgage-reporting) | The Basic sample smart contract that allows you to create and transfer mortgage reporting assets by putting data on the ledger and retrieving it. | [Writing your first application](https://hyperledger-fabric.readthedocs.io/en/latest/write_first_app.html) | Java | Java |


