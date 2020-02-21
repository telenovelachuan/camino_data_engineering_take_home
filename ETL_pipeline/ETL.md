We are receiving 1000 records per second, so approximately every second 50MB JSON data flush in. A distributed message queue would be a good choice here for load balance and future scalability.
Kafka could be used here to perform as a streaming data receiver, which provides API for producer and consumers. Also, Kafka can be deployed in a distributed way on a cluster, with ZooKeeper taking control of the orchestration, synchronization, load balancing and service redundancy.

A real-time processing engine works as the Kafka consumer here to handle and preprocess incoming streaming data. It does the JSON parsing here, as well as other SLA sensitive tasks such as data monitoring and alarm notification.
The parsed JSON data can be utilized in 2 ways, which corresponds to 2 business scenarios: online decision and offline analytics.

###### Online Decision

This is a real time data scenario that is highly SLA sensitive. Structured data after parsing are fed into data warehouses such as Teradata and online web services like AWS and Cloudera, where real time analysis could be enabled by data warehouse OLAP APIs.

###### Offline Analytics




