## Q.1. What is the main difference between SQL and NoSQL databases?

The main difference between SQL (Structured Query Language) and NoSQL (Not only SQL) databases are:

a. SQL databases are **relational**, and NoSQL databases are **non-relational**.

b. SQL databases use **structured query language (SQL) and have a predefined schema**. NoSQL databases have **dynamic schemas for unstructured data**.

c. SQL databases are **vertically scalable**, while NoSQL databases are **horizontally scalable**.

d. SQL databases are **table-based**, while NoSQL databases are **document, key-value, graph, or wide-column stores**.

e. SQL databases are better for **multi-row transactions**, while NoSQL is better for **unstructured data like documents or JSON**.

## Q2. What are some of the benefits of using NoSQL databases over traditional SQL databases?

Using NoSQL databases offers several benefits over traditional SQL databases, depending on the specific use case and requirements. Here are some advantages of NoSQL databases:

### Flexibility

With SQL databases, data is stored in a much more rigid, predefined structure. But with NoSQL, data can be stored in a more free-form fashion without those rigid schemas. This design enables innovation and rapid application development. Developers can focus on creating systems to better serve their customers without worrying about schemas. NoSQL databases can easily handle any data format, such as structured, semi-structured, and non-structured data in a single data store.

### Scalability

Instead of scaling up by adding more servers, NoSQL databases can scale out by using commodity hardware. This has the ability to support increased traffic in order to meet demand with zero downtime. By scaling out, NoSQL databases can become larger and more powerful, which is why they have become the preferred option for evolving data sets.

### High performance

The scale-out architecture of a NoSQL database can be particularly valuable when data volume or traffic increases. As shown in the graphic below, this architecture ensures fast and predictable single-digit millisecond response times. NoSQL databases can also ingest data and deliver it quickly and reliably, which is why NoSQL databases are used in applications that collect terabytes of data every day, while also requiring a highly interactive user experience.

### Availability

NoSQL databases automatically replicate data across multiple servers, data centers, or cloud resources. In turn, this minimizes latency for users, no matter where they’re located. This feature also works to reduce the burden of database management, which frees up time to focus on other priorities.

### Highly Functional

NoSQL databases are designed for distributed data stores that have extremely large data storage needs. This is what makes NoSQL the ideal choice for big data, real-time web apps, customer 360, online shopping, online gaming, Internet of things, social networks, and online advertising applications.

## Q3. What are some common use cases for NoSQL databases?

NoSQL databases are well-suited for various use cases that involve handling unstructured or semi-structured data, high scalability, flexible schema designs, and distributed computing. Here are some common use cases for NoSQL databases:

## Content Management Systems:

NoSQL databases can efficiently handle the storage and retrieval of content, such as articles, blog posts, user-generated content, and multimedia assets. Their flexible schema designs accommodate diverse data types, allowing for easy content organization and retrieval.

## Real-Time Analytics:

NoSQL databases excel at handling large volumes of data in real-time, making them suitable for analytics use cases. They can ingest, store, and process high-velocity data streams, enabling real-time analysis and insights.

## Internet of Things (IoT) Data Storage:

IoT applications generate massive amounts of data from sensors, devices, and connected systems. NoSQL databases can handle the high throughput and flexible data structures required for storing and processing IoT data efficiently.

## Personalization and Recommendation Systems:

NoSQL databases are commonly used in applications that require personalized user experiences and recommendation systems. They can store and retrieve user profiles, preferences, and behavioral data, enabling efficient personalization and recommendation algorithms.

## Social Media Platforms:

Social media platforms deal with a vast amount of user-generated content, relationships, and real-time interactions. NoSQL databases can handle the storage, retrieval, and analysis of social media data, supporting features such as news feeds, user profiles, and social graphs.

## E-commerce Systems:

NoSQL databases can power e-commerce platforms by efficiently storing and retrieving product catalogs, customer data, and transaction records. They can handle high traffic loads, flexible product attributes, and personalized user experiences.

## Time-Series Data Analysis:

NoSQL databases are well-suited for storing and analyzing time-series data, such as logs, sensor readings, financial data, or monitoring data. They can handle large volumes of timestamped data efficiently and support queries for time-based analysis.

## Distributed Systems and Caching:

NoSQL databases, particularly key-value stores, are used as distributed caching layers to improve the performance of applications by reducing database load. They can store frequently accessed data in-memory or on disk, providing fast data retrieval and reducing latency.

## Graph Databases:

NoSQL graph databases are specifically designed to handle interconnected data, such as social networks, recommendation engines, or fraud detection systems. They excel at traversing relationships and performing graph-based queries efficiently.

## Q4. What are the four main types of NoSQL databases, and what are their key characteristics?

The four main types of NoSQL databases are:

### Key-Value Stores:

The simplest type of NoSQL database is a key-value store. Every data element in the database is stored as a key value pair consisting of an attribute name (or "key") and a value. In a sense, a key-value store is like a relational database with only two columns: the key or attribute name (such as "state") and the value (such as "Alaska").

### Document Databases:

A document database stores data in JSON, BSON, or XML documents (not Word documents or Google Docs, of course). In a document database, documents can be nested. Particular elements can be indexed for faster querying.

Documents can be stored and retrieved in a form that is much closer to the data objects used in applications, which means less translation is required to use the data in an application. SQL data must often be assembled and disassembled when moving back and forth between applications and storage.

### Columnar Databases:

Columnar databases store data in columns rather than rows, allowing for efficient storage and retrieval of large datasets. They are optimized for analytical workloads and handling massive amounts of data. Columnar databases are well-suited for applications that require fast aggregations, data compression, and ad-hoc queries on large datasets. Examples include Apache Cassandra, Apache HBase, and Vertica.

### Graph Databases:

A graph database focuses on the relationship between data elements. Each element is stored as a node (such as a person in a social media graph). The connections between elements are called links or relationships. In a graph database, connections are first-class elements of the database, stored directly. In relational databases, links are implied, using data to express the relationships.

## Q5. What is the CAP theorem, and how does it relate to distributed systems?

The CAP theorem, also known as Brewer's theorem, states that distributed databases can have at most two of the three properties: **Consistency**, **Availability**, and **Partition tolerance**. As a result, database systems prioritize only two properties at a time.

### a. Consistency

Consistency means that the nodes will have the same copies of a replicated data item visible for various transactions. A guarantee that every node in a distributed cluster returns the same, most recent and a successful write. Consistency refers to every client having the same view of the data. There are various types of consistency models. Consistency in CAP refers to sequential consistency, a very strong form of consistency.

### b. Availability

Availability means that each read or write request for a data item will either be processed successfully or will receive a message that the operation cannot be completed. Every non-failing node returns a response for all the read and write requests in a reasonable amount of time. The key word here is “every”. In simple terms, every node (on either side of a network partition) must be able to respond in a reasonable amount of time.

### c. Partition tolerance

Partition tolerance means that the system can continue operating even if the network connecting the nodes has a fault that results in two or more partitions, where the nodes in each partition can only communicate among each other. That means, the system continues to function and upholds its consistency guarantees in spite of network partitions. Network partitions are a fact of life. Distributed systems guaranteeing partition tolerance can gracefully recover from partitions once the partition heals.

The CAP theorem states that in the event of a network partition (P), a distributed system must choose between providing either consistency (C) or availability (A). It is not possible to guarantee both properties simultaneously.

When faced with a network partition, a system that prioritizes consistency will halt operations or return an error to ensure that all nodes have consistent data. On the other hand, a system that prioritizes availability will continue to respond to client requests, even if it means that different nodes may have slightly inconsistent data.

It's important to note that the CAP theorem assumes a distributed system will inevitably encounter network partitions due to the inherent nature of distributed environments. Therefore, it highlights the trade-offs that must be considered when designing and implementing distributed systems.

In practice, many distributed systems aim for high availability and partition tolerance while relaxing strict consistency guarantees. Various strategies, such as eventual consistency, conflict resolution mechanisms, and replication techniques, are employed to strike a balance between consistency and availability based on the specific requirements of the application.

## Q6. What are the three properties of the CAP theorem?

folllowing are the three properties of CAP theorem :

### a. Consistency

Consistency means that the nodes will have the same copies of a replicated data item visible for various transactions. A guarantee that every node in a distributed cluster returns the same, most recent and a successful write. Consistency refers to every client having the same view of the data. There are various types of consistency models. Consistency in CAP refers to sequential consistency, a very strong form of consistency.

### b. Availability

Availability means that each read or write request for a data item will either be processed successfully or will receive a message that the operation cannot be completed. Every non-failing node returns a response for all the read and write requests in a reasonable amount of time. The key word here is “every”. In simple terms, every node (on either side of a network partition) must be able to respond in a reasonable amount of time.

### c. Partition tolerance

Partition tolerance means that the system can continue operating even if the network connecting the nodes has a fault that results in two or more partitions, where the nodes in each partition can only communicate among each other. That means, the system continues to function and upholds its consistency guarantees in spite of network partitions. Network partitions are a fact of life. Distributed systems guaranteeing partition tolerance can gracefully recover from partitions once the partition heals.

## Q7. What are the BASE properties, and how do they relate to the CAP theorem?

The BASE properties are an alternative set of characteristics for distributed systems that provide a different perspective than the ACID properties of traditional SQL databases. BASE stands for Basically Available, Soft state, and Eventually consistent. These properties are often associated with NoSQL databases and distributed systems designed for high scalability and availability. Here's a breakdown of the BASE properties:

## Basically Available:

The Basically Available property implies that the system should remain operational and responsive, even in the face of failures or network partitions. It emphasizes the importance of maintaining high availability, ensuring that the system continues to serve requests and provide responses.

## Soft state:

The Soft state property acknowledges that the system's state may be transient or mutable. It allows the system's state to evolve over time, even without external inputs, which can result in temporary inconsistencies. This characteristic enables flexibility in the system, allowing it to adapt and scale while accepting temporary inconsistencies as a trade-off.

## Eventually consistent:

The Eventually consistent property implies that the system will achieve consistency over time, given that it operates in a distributed environment. It acknowledges that, due to factors such as network delays or partitions, different replicas or nodes may temporarily have inconsistent views of the data. However, the system is designed to converge towards a consistent state eventually.

The BASE properties can be seen as a trade-off to the strict consistency guarantees of traditional SQL databases (ACID properties) emphasized by the CAP theorem. While the CAP theorem highlights the impossibility of achieving strong consistency, high availability, and partition tolerance simultaneously, the BASE properties provide an alternative approach that favors availability and scalability, relaxing strict consistency requirements.

In practice, systems that adhere to the BASE properties often employ techniques such as eventual consistency, conflict resolution mechanisms, distributed caching, and replication strategies to strike a balance between availability and consistency based on the specific requirements of the application.
