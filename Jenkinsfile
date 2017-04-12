node('swarm') {
    stage 'Checkout'
    git 'https://github.com/yunlzheng/jpetstore-6.git'

    stage 'Package'
    sh 'mvn clean package -DskipTests -DargLine="-Xmx1024m"'
    sh 'cp target/jpetstore.war docker/'
    dir('docker') {
      sh 'docker build -t jpetstore:$BUILD_NUMBER .'
      sh 'docker tag jpetstore:$BUILD_NUMBER 192.168.50.103:5000/jpetstore:$BUILD_NUMBER'
      sh 'docker push 192.168.50.103:5000/jpetstore:$BUILD_NUMBER'
    }

    stage 'Test'

    echo 'deploy app to TEST env'

    dir('docker') {
      sh '/usr/local/rancher-compose-v0.8.4/rancher-compose --url http://192.168.50.101:8080 --access-key ACD7F882853FA5B96F03 --secret-key KHxC91gsw56mbbqBcit1jJasvTVCYU4DjL1ZD9Rs -p PetStore-test up -d'
    }

    stage 'UAT'

    input '是否部署到UAT环境'

    dir('docker') {
      sh '/usr/local/rancher-compose-v0.8.4/rancher-compose --url http://192.168.50.101:8080 --access-key ACD7F882853FA5B96F03 --secret-key KHxC91gsw56mbbqBcit1jJasvTVCYU4DjL1ZD9Rs -p PetStore-uat up -d'
    }

    // stage 'Prod'

    // input '是否部署到PROD环境'

    // dir('docker') {
    // sh '/usr/local/rancher-compose-v0.8.4/rancher-compose --url http://192.168.50.101:8080 --access-key ACD7F882853FA5B96F03 --secret-key KHxC91gsw56mbbqBcit1jJasvTVCYU4DjL1ZD9Rs -p PetStore-prod up -d'
    // sh 'docker tag -f 192.168.50.103:5000/jpetstore:$BUILD_NUMBER 192.168.50.103:5000/jpetstore:latest'
    //sh 'docker push 192.168.50.103:5000/jpetstore:latest'
    //}
}
