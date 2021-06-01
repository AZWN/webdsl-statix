properties([
  pipelineTriggers([
    upstream(
      threshold: hudson.model.Result.SUCCESS,
      upstreamProjects: '/webdsl/webdsl-statix/master' // build this project after webdsl-statix master is built
    )
  ]),
  buildDiscarder(logRotator(artifactNumToKeepStr: '10')),
  disableConcurrentBuilds() //disableds parallel builds
])

node{
  try{
    stage('Checkout') {
      checkout scm
      sh "git clean -fXd"
    }

    stage('Build and Test') {
      withMaven(
        //mavenLocalRepo: "${env.JENKINS_HOME}/m2repos/${env.EXECUTOR_NUMBER}", //http://yellowgrass.org/issue/SpoofaxWithCore/173
        mavenLocalRepo: ".repository",
        mavenOpts: '-Xmx1G -Xms1G -Xss16m'
      ){
        sh './run_spt_tests'
      }
    }

    stage('Archive') {
      archiveArtifacts(
        artifacts: 'result/',
        excludes: null,
        onlyIfSuccessful: false
      )
    }

    stage('Cleanup') {
      sh "git clean -fXd"
    }

  } catch (e) {

    throw e

  }
}