## Q1. What are the main features of redis?

Redis (Remote Dictionary Server) is an open-source, in-memory data structure store that provides several key features:

### a. In-memory datastore

All Redis data is stored in the server’s main memory in contrast to the conventional relational databases such as SQL, Oracle, etc that store most data on disk or SSDs. In-memory data stores such as Redis don’t suffer the same penalty as non-in-memory databases suffer to access disks or SSDs. It gives faster response times. So it gives applications super-fast performance and support for millions of operations per second.

### b. High availability and scalability

Redis offers a primary-replica architecture in a single node primary or a clustered topology. This allows you to build highly available solutions providing consistent performance and reliability. As Redis is Single-Threaded, Only one thread is associate with I/O operations.

### c. Data Persistence

Data Persistence means that the data survives after the producer process of the particular data has ended. In other terms, Saved data must last even if the server failure occurs. For a data store to be considered persistent, It must write on permanent storage (non Volatile such as a hard disk). For persistence, Redis supports point-in-time backups (copying the Redis data set to disk).

### d. Rich Data Structures

Redis is more than just a usual key-value datastore technology. It offers a vast variety of data structures to meet our application needs. It enables users to implement applications according to the client’s requirements not associated with the technology limitations.

### e. Simplicity

Redis Supported languages include C, C++, C#, Java, JavaScript, Node.js, Python, PHP, Ruby, R and many others. The Redis comes with native data structures as mentioned above. Redis has very large open community support. It enables extensibility to the Redis.

## Q2. Write down the limitations of redis?

While Redis is a powerful and widely-used data store, it does have certain limitations and considerations to keep in mind:

### a. Data Size:

Redis is primarily an in-memory data store, which means the size of your data is limited by the available memory. If your dataset exceeds the available memory, it can lead to performance issues or data eviction.

### b. Scalability:

Redis can scale vertically by adding more memory to a single instance, but scaling horizontally across multiple nodes can be more complex. While Redis Cluster provides some support for horizontal scaling, it has certain limitations and may require careful planning and configuration.

### c. Disk Persistence:

While Redis offers persistence mechanisms like RDB and AOF, they come with trade-offs. RDB snapshots can result in some data loss in the event of a system crash, while AOF persistence can increase disk space usage and potentially impact performance.

### d. Complex Queries:

Redis provides basic querying capabilities, but it doesn't support complex querying like SQL databases. Performing complex queries typically requires retrieving data from Redis and processing it in the client application.

### e. No Transactions Across Keys:

Redis transactions (MULTI/EXEC) are atomic within a single key, but they do not span multiple keys. If you need atomicity across multiple keys, you'll need to use Lua scripting or other application-level mechanisms.

### f. Limited Data Structures:

Redis offers several data structures, but they are relatively simple compared to other databases. It lacks features like referential integrity, constraints, and relationships found in traditional relational databases.

### g. Data Eviction:

When Redis reaches its memory limit, it employs different eviction policies to make space for new data. This can lead to older or less frequently accessed data being evicted, which may impact application behavior or require careful management of data eviction policies.

### h. No ACID Transactions:

Redis sacrifices some ACID properties (Atomicity, Consistency, Isolation, Durability) for performance and scalability. While it supports atomic operations, it does not provide full ACID compliance like traditional relational databases.

## Q3. Perform a basic CRUD operation using redis.

#### Create (C) -

To create a new data entry in Redis, you can use the SET command to set a key-value pair.
Example:
`SET user:1 "John Doe"`
In this example, we create a new key "user:1" with the value "John Doe".

#### Read (R) -

To retrieve data from Redis, you can use the GET command to fetch the value associated with a specific key.
Example:
`GET user:1`
This command retrieves the value associated with the key "user:1", which in this case is "John Doe".

#### Update (U) -

To update existing data in Redis, you can use the SET command again to assign a new value to an existing key.
Example:

`SET user:1 "Jane Smith"`
This command updates the value associated with the key "user:1" to "Jane Smith".

#### Delete (D) -

To delete data from Redis, you can use the DEL command to remove a specific key and its associated value.

Example:
`DEL user:1`
This command deletes the key "user:1" and its value from Redis.

## Q4. Explain TTL command with an example.

Time to live (TTL) is an integer value that specifies the number of seconds until the key expires. Redis can specify seconds or milliseconds for this value. When an application attempts to read an expired key, it is treated as though the key is not found. The database is queried for the key and the cache is updated. This approach doesn't guarantee that a value isn't stale. However, it keeps data from getting too stale and requires that values in the cache are occasionally refreshed from the database.

The syntax for setting the TTL of a key in Redis is as follows:
`TTL key`
Here's an example to illustrate the TTL command:

```
SET mykey "Hello, Redis!"
EXPIRE mykey 60
TTL mykey
```

In this example, we set the value of the key "mykey" to "Hello, Redis!" using the SET command. Then, we use the EXPIRE command to set the TTL of "mykey" to 60 seconds, indicating that it should expire and be deleted from the database after 60 seconds. Finally, we use the TTL command to check the remaining time to live for the key "mykey".

If the TTL command returns a positive value, it indicates the number of seconds remaining for the key to expire. If it returns a negative value or -2, it means that the key does not exist or has no associated TTL (i.e., it does not expire). A return value of -1 indicates that the key exists but has no specific TTL set.

By setting a TTL on keys, you can automate the process of key expiration and avoid manual deletion of expired data. This is particularly useful for implementing caching mechanisms, session management, and other scenarios where data needs to be automatically cleared after a certain time.

## Q5. Create a transaction in redis to perform the following operations.

● Create two keys in a single line and one key differently. (one value should be number)

```
mset user:1 "Spider-man" user:2 "Batman"

set num "100"
```

● Read any two value in a single line

```
mget user:1 num
```

● Increment the number value

```
incr num
```

● Expire any two keys after some time

```
expire num 30

ttl num

expire user:1 40

ttl user:1
```
