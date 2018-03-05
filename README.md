# TestContainers LocalStack AWS testing module

Testcontainers module for the Atlassian's [LocalStack](https://github.com/localstack/localstack), 'a fully functional local AWS cloud stack'.

See [testcontainers.org](https://www.testcontainers.org) for more information about Testcontainers.

<!--[![Build Status](https://travis-ci.org/testcontainers/testcontainers-java.svg?branch=master)](https://travis-ci.org/testcontainers/testcontainers-java)-->

## Usage example

Running LocalStack as a stand-in for AWS S3 during a test:

```java
public class SomeTest {

    @Rule
    public LocalStackContainer localstack = new LocalStackContainer()
            .withServices(S3);
    
    @Test
    public void someTestMethod() {
        AmazonS3 s3 = AmazonS3ClientBuilder
                        .standard()
                        .withEndpointConfiguration(localstack.getEndpointConfiguration(S3))
                        .withCredentials(localstack.getDefaultCredentialsProvider())
                        .build();
        
                s3.createBucket("foo");
                s3.putObject("foo", "bar", "baz");
```

## Dependency information

### Maven

```
<dependency>
    <groupId>org.testcontainers</groupId>
    <artifactId>localstack</artifactId>
    <version>1.6.0</version>
</dependency>
```

### Gradle

```
compile group: 'org.testcontainers', name: 'localstack', version: '1.4.3'
```


## License

See [LICENSE](LICENSE).

## Copyright

Copyright (c) 2015 - 2017 Richard North and other authors.

See [AUTHORS](AUTHORS) for contributors.
