# api-springboot-hello-world
Hello world REST API

# Quick start

To start the application locally.

- Install Java14 (You can install Java using [homebrew](https://brew.sh/) and manage using [jenv](https://github.com/jenv/jenv))
- Clone this repo and change directory to the root of the repo.
- Compile and start the application
```
./gradlew bootRun
```
- Test the API
```
curl -v http://localhost:8080/greeting
...
{"id":1,"content":"Hello, World!"}


curl -v http://localhost:8080/greeting\?name\=SpongeBob
...
{"id":2,"content":"Hello, SpongeBob!"}
```

# Compile the application
```
./gradlew build
```
The application will be build under
```
build/libs/
```

# Tests and release
