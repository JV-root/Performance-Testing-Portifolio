# Baseline Performance Testing Plan - Easy Travel

## 1. Introduction
The purpose of this document is to outline the plan for conducting performance testing for the EasyTravel application. This document will provide an overview of the following components:
- Context;
- testing objectives;
- scope;
- test environment;
- test scenarios;
- performance metrics to be measured.

## 2. Context
Easy Travel is a travel platform that offers users an intuitive and accessible web portal. Through this portal, users can explore a variety of travel options and make their purchases conveniently using a credit card.

Tom, the person in charge of the application launch, is reviewing the final details before making the platform available to the public. He understands that the success of EasyTravel depends not only on its functionality but also on its ability to handle high user demand.

In this scenario, Tom and his team plan to perform a technical certification to measure how many simultaneous users the application can support in two different scenarios: one using a t2.medium instance and another using a t2.large instance on the AWS cloud provider.

## 2. Testing Objectives
The main objectives of the performance testing are:
- Create an initial performance metric of the system in its current configuration.
- Serve as a baseline for comparison with future results after system changes.
- Create acceptance criteria for future system modifications.
- Ensure that the system meets user performance expectations.

## 3. Methodology
The performance testing methodology will be baseline, which consists of establishing an initial reference point for the performance of the system, application, or component before any significant changes. This helps understand the current performance state and provides a basis for comparison after the implementation of changes, updates, or optimizations.

## 3. Scope
The performance tests will focus on the following areas:
- Home
- User login and authentication.
- Travel search and booking.
- Credit card payment processing.

## 4. Test Environment
The performance tests will be conducted in environments with the following configurations:

- **Environment 01**: Amazon EC2 T2.Medium:
    - **CPU**: 2 vCPUs
    - **Memory**: 4 GiB RAM.
    - **Storage**: 20GB.

- **Environment 02**: Amazon EC2 T2.Large:
    - **CPU**: 2 vCPUs
    - **Memory**: 8 GiB RAM.
    - **Storage**: 20GB.

The Injector Machine will have the following configuration:
- Amazon EC2 T2.Medium:
    - **CPU**: 2 vCPUs
    - **Memory**: 4 GiB RAM.
    - **Storage**: 20GB.

## 5. Test Scenarios
The following test scenarios will be executed during the performance tests:
- **Scenario 1**: Simulate 30 concurrent users logging in, searching, and booking trips in Environment 01.
- **Scenario 2**: Simulate 30 concurrent users logging in, searching, and booking trips in Environment 02.

## 6. Performance Metrics
The following performance metrics will be measured during the tests:
- Response time: The time it takes for the application to respond to user requests.
- Throughput: The number of requests processed per unit of time.
- Error rate: The percentage of failed requests.
- CPU and memory utilization: The usage of system resources during the tests.

## 7. Test Execution
The performance tests will be executed in the following steps:
1. Set up the test environment.
2. Configure the load testing tool.
3. Execute the test scenarios.
4. Monitor and collect performance metrics.
5. Analyze the test results.
6. Identify any performance issues and bottlenecks.
7. Provide recommendations for performance optimization.
