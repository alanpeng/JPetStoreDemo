MyBatis JPetStore
=================

JPetStore 6 is a full web application built on top of MyBatis 3, Spring 4 and Stripes.

Essentials
----------

* [See the docs](http://www.mybatis.org/jpetstore-6)

## Other versions that you may want to know about

- JPetstore on top of Spring, Spring MVC, MyBatis 3, and Spring Security https://github.com/making/spring-jpetstore
- JPetstore with Vaadin and Spring Boot with Java Config https://github.com/igor-baiborodine/jpetstore-6-vaadin-spring-boot

## Build Project
  - with maven: `mvn clean install`
  - with gradle: `gradle clean build`

## Running with Tomcat
Running JPetStore sample under Tomcat (using maven).
- Clone this repository
- Open command prompt/shell and change to cloned directory
- Issue following command to run project using Tomcat

mvn clean tomcat:run

- Run application in browser http://localhost:8080/jpetstore/ 
- Press Ctrl-C to stop the server.

## Run with Gradle

```
gradle jettyRun
```

## Run RobotFramework Test Case

```
pybot -d target -x target/xunit.xml -v SERVER:<IP:PORT> src/test
```
#WiseBuild配置注意事项：

WiseBuild 构建命令写法如下（实际中请将192.168.9.10换成正确的maven私服地址，对于WiseBuild，它就是artifactory容器所在的宿主机IP，需暴露8081端口）：
```
gradle clean build -PMavenRepoServerIP=192.168.9.10
```

构建环境选择：
```
dgroup/java8-gradle
```

归档文件写法：
```
./docker/*.war
```

Dockerfile路径：
```
docker/Dockerfile
```

镜像标签格式示例：
```
192.168.9.11/wisebuild-demo/jpetstore:${BUILD_NUMBER}
```
