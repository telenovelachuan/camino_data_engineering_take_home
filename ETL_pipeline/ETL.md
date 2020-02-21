We are receiving 1000 records per second, so approximately every second 50MB JSON data flush in. A distributed message queue would be a good choice here for load balance and future scalability.
Kafka could be used here to perform as a streaming data receiver, which provides API for producer and consumers. Also, Kafka can be deployed in a distributed way on a cluster, with ZooKeeper taking control of the orchestration, synchronization, load balancing and service redundancy.

A real-time processing engine works as the Kafka consumer here to handle and preprocess incoming streaming data. It does the JSON parsing here, as well as other real time tasks such as data monitoring and alarm notification.
The parsed JSON data can be utilized in 2 ways, which corresponds to 2 business scenarios: online decision and offline analytics.

- Online Decision

This is a real time data scenario that is sensitive to response time. Structured data after parsing are fed into data warehouses such as Teradata and online web services like AWS and Cloudera, where real time analysis could be enabled by data warehouse OLAP APIs.

- Offline Analytics

For non real-time scenarios, common big data platforms could be used for data redundancy, and offline analytics such as training model, mining user behavior, etc.
The parsed data can be fed into platforms like Hadoop HDFS and Hive using Spark, Flume or Kafka API. These platforms can store both structured data and raw files to provide data redundancy.

Finally, various kinds of applications can make use of the data stored in these 2 ways. Customer related apps such as decision making take advantage of OLAP services, while offline apps such as data QA, risk modeling, automated pipelines, etc. will be the consumer of big data computing platforms.

To summarize for an end-to-end data ETL process:

###### Tool of choice

Apache Kafka with ZooKeeper, Python for data parsing(can switch to C/C++ if data throughput bulges), Teradata for online decision, Hadoop for offline analytics and Spark for customized data import into Hadoop(PySpark is great to integrate Python parser).

###### Processing frequency

For real-time scenarios, data should be updated for a higher frequency such as hourly or even half hourly, depending on its business criticality. With the increasing amount of incoming JSON data, parsing engine could be replaced by C/C++ as well.

For offline analytics, updates of some model scores could be much less frequent, varying from daily to weekly.

###### Cost

A large cost would be the bottleneck of data parsing engine. With the increase of the amount of incoming JSON data, some more efficient choices such as C/C++ or even distributed methodologies such as Spark should be preferred. 
Economically, the main costs here are the Kafka cluster(purchasing and maintaining so many servers would be expensive), and platform fees such as Teradata, Oracle and AWS.

