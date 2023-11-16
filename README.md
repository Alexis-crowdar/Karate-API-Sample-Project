# LIPPIA API Sample project Karate



## Objetivo

El proyecto consiste en una clase Java que hace uso de los "Runtime Hooks" de Karate para extraer información de las features, scenarios y steps durante la ejecución de las pruebas.
Esta información se mapea a objetos de modelo de LTM como TestSuites, TestCases y TestSteps. Luego se genera un reporte XML en formato reconocible por LTM.
Al finalizar la ejecución, el plugin automáticamente sube el reporte XML a LTM usando la API REST de LTM.
De esta forma, al ejecutar mvn test sobre las pruebas de Karate, al terminar se podrá ver los resultados en la interfaz web de LTM.


## Estructura del proyecto
```
??? src
    ??? test
         ??? java
              ??? examples
              |        ??? users
              |        |     ??? users.feature
              |        |     ??? UsersRunner.java
              |        ??? ExampleTest.java
              |        ??? TestManagerReporter.java
              ??? karate-config.js
              ??? logback-test.xml     

```

## Configuración

Para que el plugin pueda subir los reportes a LTM, se deben configurar las variables en el pom.xml, entre ellos el codigo de proyecto, que indica el proyecto donde va inyectar y el 'Run name' que indica el nombre de la run para poder verificarla en LTM:
```
        <dependency>
            <groupId>io.lippia.report</groupId>
            <artifactId>ltm-karate-adapter</artifactId>
            <version>1.0-SNAPSHOT</version>
        </dependency>
        
        
        <properties>        
        <karate.version>1.2.0</karate.version>
        <ltm.apihost>https://runs.lippia-mvp.lippia.io</ltm.apihost>
        <ltm.username>admin</ltm.username>
        <ltm.password>admin</ltm.password>
        <!--- RUN NAME -->
        <ltm.run_name>aut sample #8</ltm.run_name>
        <!--- CODE PROJECT -->
        <ltm.project_code>KARATE</ltm.project_code>
    </properties>  
        
        <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-surefire-plugin</artifactId>
                <version>3.0.0-M4</version>
                <configuration>
                    <useSystemClassLoader>false</useSystemClassLoader>
                    <systemPropertyVariables>
                        <TEST_MANAGER_API_HOST>${ltm.apihost}</TEST_MANAGER_API_HOST>
                        <TEST_MANAGER_RUN_NAME>${ltm.run_name}</TEST_MANAGER_RUN_NAME>
                        <TEST_MANAGER_PROJECT_CODE>${ltm.project_code}</TEST_MANAGER_PROJECT_CODE>
                        <TEST_MANAGER_USERNAME>${ltm.username}</TEST_MANAGER_USERNAME>
                        <TEST_MANAGER_PASSWORD>${ltm.password}</TEST_MANAGER_PASSWORD>
                    </systemPropertyVariables>
                </configuration>
        </plugin>
```
## Ejecución
Configuramos el runner con esta linea de comandos para correr las pruebas e inyectar los reportes en Lippia Test Manager.
```

clean test -DforkCount=0


clean test -DforkCount=0 "-Dcucumber.options=--tags @test"
```