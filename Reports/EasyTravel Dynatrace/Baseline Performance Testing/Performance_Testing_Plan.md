# Easy Travel Baseline Performance Testing Plan

## 1. Introduction
The purpose of this document is to outline the plan for conducting performance testing for the EasyTravel application. This document will provide an overview of the following components:
- Executive Summary;
- Application Architecture;
- Performance Testing Plan;
- Performance Testing Execution;

## 2. Executive Summary
Easy Travel is a travel platform that offers users an intuitive and accessible web portal. Through this portal, users can explore a variety of travel options and conveniently make their purchases using a credit card.

Tom, the person in charge of launching the application, is reviewing the final details before making the platform available to the public. He understands that the success of EasyTravel depends not only on its functionality but also on its ability to handle high user demand.

In light of this scenario, Tom and his team plan to conduct a technical certification to measure how many simultaneous users the application can support in two different scenarios: one using a t2.medium instance and another using a t2.large instance on the AWS cloud provider.

## 3. Application Architecture
The overall architecture consists of:

- Two Java processes providing the Client Frontend and the backend business server
- Two .NET processes providing the B2B Frontend and the payment backend server
- A C++ application that receives credit card numbers via IPC/Named Pipe and simulates number verification with a third-party provider.
- A launch GUI that allows controlling the processes and also hosts the Java Derby Database (unless another JDBC database is configured)
- A Java Derby Database to store travel data (can be easily replaced with other JDBC databases)
- A Microsoft SQL Server Compact Edition Database to store payment data
- Optionally, an instance of the Apache Web Server for load balancing

<div align="center">
    <img src="easyTravel-Technology-Architecture.png" alt="Performance Planning">

</div>

<div align="center">
    <img src="easyTravel_Architecture.png" alt="Performance Planning">

</div>

## 4. Performance Testing Plan

### 4.1 Methodology

The performance testing methodology will be baseline, which consists of establishing an initial benchmark for the performance of the system, application, or component before any significant changes. This helps understand the current performance state and provides a basis for comparison after implementing changes, updates, or optimizations.

### 4.2 Scope

| Step # | Action                                             |
|--------|----------------------------------------------------|
| 1.     | Home Page                                          |
| 2.     | User Creation                                      |
| 3.     | User Login and Authentication                      |
| 4.     | Booking recommended trips                          |
| 5.     | Processing payment with a credit card              |

### 4.3 Test Scenarios
The following test scenarios will be executed during the performance testing:

| Scenario | Simultaneous Users (VUs) | Duration | Environment |
|----------|-------------------------|----------|-------------|
| 1.       | 30 VUs                  | 30 min   | 01          |
| 2.       | 30 VUs                  | 30 min   | 02          |

### 4.4 Test Environment
The performance tests will be conducted in environments with the following configurations:

| Environment      | Type                  | CPU     | RAM         | Storage       |
|------------------|-----------------------|---------|-------------|---------------|
| Environment 01   | Amazon EC2 T2.Medium  | 2 vCPUs | 4 GiB       | 20GB          |
| Environment 02   | Amazon EC2 T2.Large   | 2 vCPUs | 8 GiB       | 20GB          |
| Injector Machine | Amazon EC2 T2.Medium  | 2 vCPUs | 4 GiB       | 20GB          |

### 4.5 Simultaneous Users (VUs) Ramp-up
During the tests, a gradual ramp-up of users will be implemented to simulate a progressive increase in load. The user ramp-up configuration will be as follows:

| Step                            | Description                                                                                                         |
|---------------------------------|---------------------------------------------------------------------------------------------------------------------|
| Test Start                      | Starts with 1 user. Every 22 seconds, a new user is added until reaching the total number in 15 minutes.           |
| Load Stabilization              | The load is kept constant at 30 users for a period of 10 minutes.                                                   |
| Gradual Thread Termination      | After the 10-minute load stabilization, the threads are gradually terminated every 20 seconds.                      |
| Total Test Duration             | The test will have a total duration of 30 minutes.                                                                  |

<div align="center">
    <img src="Baseline_Testing.png" alt="Performance Planning">

</div>

### 4.6 Data
The data mass will be provisioned through a Python script called *data_generator.py* to generate a CSV file with the following data:

- first_name
- last_name
- email
- password
- state
- street
- number
- phone
- credit_card

## 5.0 Evaluated Metrics
The following performance metrics will be measured during the tests:

| Metric                     | Description                                                                                                      |
|----------------------------|------------------------------------------------------------------------------------------------------------------|
| Response Time              | The time taken for the application to respond to user requests. The 90th and 95th percentiles will be measured. |
| Throughput                 | The number of requests processed per unit of time.                                                               |
| Error Rate                 | The percentage of failed requests.                                                                               |
| Network Latency            | The time taken to send data from one point to another in the network.                                             |
| Bandwidth                  | The maximum data transfer capacity of the network within a given time period.                                    |
| Service Availability       | The percentage of time that the service is available and functioning correctly.                                   |

Infrastructure Metrics:

| Metric                     | Description                                                                                                      |
|----------------------------|------------------------------------------------------------------------------------------------------------------|
| CPU Utilization            | The CPU utilization, indicating the percentage of processing capacity used.                                       |
| Available Memory           | The amount of available RAM in the system.                                                                       |
| Disk Utilization           | The utilization of disk storage, indicating the percentage of capacity used.                                      |
| Network Latency            | The time taken to send data from one point to another in the network.                                             |
| Bandwidth                  | The maximum data transfer capacity of the network within a given time period.                                    |
| Service Availability       | The percentage of time that the service is available and functioning correctly.                                   |
