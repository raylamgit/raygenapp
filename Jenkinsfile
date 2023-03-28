//Modifications of Priyanjana on 08/09/2022
// GitLab mvpgenapp group ray-genapp Ray 1/18/2023 10:46AM ADDED ZUNIT
// Make sure to disable Gitlab CI Pipeline
// https://developer.ibm.com/components/ibmz/tutorials/build-a-pipeline-with-jenkins-dependency-based-build-and-urbancode-deploy/
// Agent labels
echo 'cics-genapp Jenkinsfile pipeline started'
//def zOsAgentLabel = env.ZOS_AGENT_LABEL ? env.ZOS_AGENT_LABEL : 'e2e-pipeline'
def zOsAgentLabel = env.ZOS_AGENT_LABEL ? env.ZOS_AGENT_LABEL : 'DBB20_zOS-Agent'
def linuxAgent = 'master'

// GIT repositories
def srcGitRepo = 'https://github.com/PriyanjanaGit/dbb-pipeline-Mar-test.git'
def srcGitBranch = 'main'
def zAppBuildGitRepo = 'https://github.com/PriyanjanaGit/dbb-zappbuild.git'
def zAppBuildGitBranch = 'main'
def dbbGitRepo = 'https://github.com/PriyanjanaGit/dbb.git'
def dbbGitBranch = 'main'
echo 'cics-genapp Jenkinsfile pipeline DBB'
// DBB
def dbbHome='/var/dbb'
//def dbbUrl='https://dbbsample-dbb-route-dbbserver.apps.mvpopenshift.cp.fyre.ibm.com/dbb'
//def dbbUrl='https://mvpserver1.fyre.ibm.com:9443/dbb'
def dbbUrl='jdbc:db2://tvt7111.svl.ibm.com:5050/DBC1'
def dbbHlq='PROY'
def dbbBuildType='-f'
def dbbGroovyzOpts= '-Dorg.slf4j.simpleLogger -cp /u/user3/logging -DBB_PERSONAL_DAEMON'
//def dbbGroovyzOpts= '-Dorg.slf4j.simpleLogger -cp /u/user3/logging'
// def dbbGroovyzOpts= '-DBB_PERSONAL_DAEMON -Dlog4j.configurationFile=/var/dbb/conf/log4j2.properties'
// def dbbGroovyzOpts= '-Dlog4j.configurationFile=/var/dbb/conf/log4j2.properties -Djavax.net.debug=ssl,handshake:verbose -Djdk.tls.client.protocols=TLSv1.2 -Dcom.ibm.jsse2.overrideDefaultTLS=true -Dcom.ibm.jsse2.overrideDefaultProtocol=TLSv1.2 '
//def dbbBuildExtraOpts= '-zTest'
def dbbBuildExtraOpts= ''

def dbbCredentialOptions='-id proy -pf /u/proy/pass.txt --url jdbc:db2://tvt7111.svl.ibm.com:5050/DBC1 '
//def dbbCredentialOptions='-id admin -pf admin --url jdbc:db2://tvt7111.svl.ibm.com:5050/DBC1 '
//def dbbCredentialOptions='-id RLAM -pf /var/dbb/conf/rlam.txt --url jdbc:db2://tvt7111.svl.ibm.com:5050/DBC1 '


echo 'cics-genapp Jenkinsfile pipeline Artifactory'
// Artifactory
def artiCredentialsId = 'Priya_artifactory_id'
//def artiCredentialsId = 'proyapikey'
def ARTIFACTORY_URL='https://na.artifactory.swg-devops.com/artifactory/'
//def ARTIFACTORY_REPO_PATH='hyc-mvp-team-maven-local/MVPGenapp'
def ARTIFACTORY_REPO_PATH='hyc-mvp-team-maven-local/PriyaGenapp'



// UCD
def ucdApplication = 'RayDemo_App'
def ucdProcess = 'Proy_Deploy_App_Bind_CICS_WEB_Proc'
//def ucdProcess = 'Ray_Deploy_App_Bind_CICS_EXT_Proc'
def ucdComponent = 'IBMDemo'
def ucdEnv = 'Dev'
def ucdSite = 'Jenkins2UCDServer'
def ucdBuztool = '/var/ucd/v73/bin/buztool.sh'
// Verbose
def verbose = true

// Private
def hasBuildFiles = true
def idzCodeReviewFlag = true
def buildVerbose = ''
/*
@NonCPS
String getArtifactoruUrl(String artiUrl) {
    // UCD always add /artifactory
    def exp =  /(.*)\\/artifactory?$/
    def match = artiUrl =~ exp
    if (match.find()) {
        return match.group(1)
    }
    return artiUrl
}
*/

echo 'cics-genapp Jenkinsfile pipeline Stage Git Clone/Refresh '
pipeline {

    agent { label linuxAgent }

    options { skipDefaultCheckout(true) }

    // to set environment variables flag
    environment {
      RUN_IDZ_CODE_REVIEW=false
//        RUN_IDZ_CODE_REVIEW=true
        JAVA_HOME='/usr/lpp/java/J11.0_64'
        IBM_JAVA_ENABLE_ASCII_FILETAG='ON'
        DBB_HOME='/var/dbb'
        DBB_CONF='/var/dbb/conf'
    //  DBB_URL='https://dbbsample-dbb-route-dbbns.apps.mvpopenshift.cp.fyre.ibm.com/dbb/'
    //  DBB_URL='https://mvpserver1.fyre.ibm.com:9443/dbb'
 		DBB_URL='jdbc:db2://tvt7111.svl.ibm.com:5050/DBC1'
        DBB_HLQ='PROY'
        ARTIFACTORY_URL='https://na.artifactory.swg-devops.com/artifactory'
//        ARTIFACTORY_REPO_PATH='hyc-mvp-team-maven-local/MVPGenapp'
        ARTIFACTORY_REPO_PATH='hyc-mvp-team-maven-local/PriyaGenapp'
        UCD_BUZTOOL_PATH='/var/ucd/v73/bin/buztool.sh'
        UCD_HOME='/var/ucd/v73'
        _BPX_JOBNAME = 'JENJOB'
     //  GROOVYZ_BUILD_EXTRA_OPTS='-DBB_PERSONAL_DAEMON'
     // GROOVYZ_BUILD_EXTRA_OPTS='-DBB_DAEMON_HOST 127.0.0.1 -DBB_DAEMON_PORT 8181'







    }
    stages {

        stage('Git Clone/Refresh') {
            agent { label zOsAgentLabel }
            steps {
                script {
                    // Verbose
                    verbose = env.VERBOSE && env.VERBOSE == 'true' ? true : false
                    buildVerbose = verbose ? '-v' : ''
                    if ( verbose ) {
                        echo sh(script: 'env|sort', returnStdout: true)
                    }

echo 'cics-genapp Jenkinsfile pipeline Check Env '
                    if ( env.DBB_HOME == null )
                        error("DBB_HOME is not defined !!!")
                    if ( env.DBB_URL == null )
                        error("DBB_URL is not defined !!!")
                    if ( env.DBB_HLQ == null )
                        error("DBB_HLQ is not defined !!!")
                    if ( env.ARTIFACTORY_URL == null )
                        error("ARTIFACTORY_URL is not defined !!!")
                    if ( env.ARTIFACTORY_REPO_PATH == null )
                        error("ARTIFACTORY_REPO_PATH is not defined !!!")
                    if ( env.UCD_BUZTOOL_PATH == null )
                        error("UCD_BUZTOOL_PATH is not defined !!!")

echo 'cics-genapp Jenkinsfile pipeline dir -> cics-genapp '
                    dir('cics-genapp') {
                        sh(script: 'rm -f .git/info/sparse-checkout', returnStdout: true)
                        srcGitRepo = scm.getUserRemoteConfigs()[0].getUrl()
                        srcGitBranch = scm.branches[0].name
                        def scmVars = null
                        scmVars = checkout([$class: 'GitSCM', branches: [[name: srcGitBranch]],
                                                doGenerateSubmoduleConfigurations: false,
                                                extensions: [
                                                [$class: 'SparseCheckoutPaths',
                                                   sparseCheckoutPaths:[[$class:'SparseCheckoutPath',
                                                   path:'cics-genapp/']]]
                                                ],
                                                submoduleCfg: [],
                                                userRemoteConfigs: [[
                                                                     url: srcGitRepo,
                                                                     ]]])
                    }

                    dir("dbb-zappbuild") {
                        sh(script: 'rm -f .git/info/sparse-checkout', returnStdout: true)
                        def scmVars =
                            checkout([$class: 'GitSCM', branches: [[name: zAppBuildGitBranch]],
                              doGenerateSubmoduleConfigurations: false,
                              submoduleCfg: [],
                            userRemoteConfigs: [[
                                url: zAppBuildGitRepo,
                            ]]])
                    }

                    dir("dbb") {
                        sh(script: 'rm -f .git/info/sparse-checkout', returnStdout: true)
                        def scmVars =
                            checkout([$class: 'GitSCM', branches: [[name: dbbGitBranch]],
                              doGenerateSubmoduleConfigurations: false,
                              extensions: [
                                       [$class: 'SparseCheckoutPaths',  sparseCheckoutPaths:[
                                          [$class:'SparseCheckoutPath', path:'Pipeline/CreateUCDComponentVersion/'],
                                          [$class:'SparseCheckoutPath', path:'Pipeline/RunIDZCodeReview/']
                                       ]]
                                    ],
                              submoduleCfg: [],
                            userRemoteConfigs: [[
                                url: dbbGitRepo,
                            ]]])
                    }
                }
            }
        }

        stage('DBB Build & UnitTest & Code Coverage') {
            steps {
                script{
                    def zUnitContents = []
                    def cccFolder = null
                    node( zOsAgentLabel ) {
                        if ( env.DBB_BUILD_EXTRA_OPTS != null ) {
                           dbbBuildExtraOpts = env.DBB_BUILD_EXTRA_OPTS
                        }
                        if ( env.DBB_BUILD_TYPE != null ) {
                            dbbBuildType = env.DBB_BUILD_TYPE
                        }
                        if ( env.DBB_CREDENTIAL_OPTIONS != null ) {
                            dbbCredentialOptions = env.DBB_CREDENTIAL_OPTIONS
                        }
                        if ( env.GROOVYZ_BUILD_EXTRA_OPTS != null ) {
                            dbbGroovyzOpts = env.GROOVYZ_BUILD_EXTRA_OPTS
                        }
                        def dbbZunitCccOpts = ''
                        if ( env.CCC_HOST != null && env.CCC_PORT != null && env.CCC_FOLDER != null ) {
                            dbbZunitCccOpts="-cc -cch ${env.CCC_HOST} -ccp ${env.CCC_PORT}"
                            cccFolder = env.CCC_FOLDER
                        }
                        idzCodeReviewFlag = env.RUN_IDZ_CODE_REVIEW && env.RUN_IDZ_CODE_REVIEW == 'true' ? true : false
                        dbbHome = env.DBB_HOME
                        dbbUrl = env.DBB_URL
                        dbbHlq = env.DBB_HLQ
                        sh "$dbbHome/bin/groovyz $dbbGroovyzOpts ${WORKSPACE}/dbb-zappbuild/build.groovy --logEncoding UTF-8 -w ${WORKSPACE} --application cics-genapp --sourceDir ${WORKSPACE}/cics-genapp  --workDir ${WORKSPACE}/BUILD-${BUILD_NUMBER} --hlq ${dbbHlq}.GENTEST  $dbbCredentialOptions -d $dbbBuildType $buildVerbose $dbbZunitCccOpts $dbbBuildExtraOpts "
                        def files = findFiles(glob: "**BUILD-${BUILD_NUMBER}/**/buildList.txt")
                        // Do not enter into some steps if nothing in the build list
                        hasBuildFiles = files.length > 0 && files[0].length > 0

                        def zUnitFiles = findFiles(glob: "**BUILD-${BUILD_NUMBER}/**/*.zunit.report.log")
                        zUnitFiles.each { zUnit ->
                            println "Process zUnit: $zUnit.path"
                            def zUnitContent = readFile file: zUnit.path
                            zUnitContents << zUnitContent
                        }
                    }
                    zUnitContents.each { zUnitContent ->
                        writeFile file: '/tmp/zUnit.zunit', text:zUnitContent
                        sh (returnStatus: true, script: '''#!/bin/sh
                            curl --silent https://raw.githubusercontent.com/ibm/dbb-pipeline/main/cics-genapp/zUnit/xsl/AZUZ2J30.xsl -o /tmp/AZUZ2J30.xsl
                            xsltproc /tmp/AZUZ2J30.xsl /tmp/zUnit.zunit > ${WORKSPACE}/zUnit.xml
                        ''')
                        junit "zUnit.xml"
                    }
                    if ( cccFolder != null ) {
                        env.CCC_FOLDER = cccFolder
                        sh (returnStatus: true, script: '''#!/bin/sh
                            mkdir -p ${WORKSPACE}/BUILD-${BUILD_NUMBER}
                            mv -f ${CCC_FOLDER}/*.pdf ${WORKSPACE}/BUILD-${BUILD_NUMBER}
                            mv -f ${CCC_FOLDER}/*.cczip ${WORKSPACE}/BUILD-${BUILD_NUMBER}
                        ''')
                        dir("${WORKSPACE}/BUILD-${BUILD_NUMBER}") {
                            archiveArtifacts allowEmptyArchive: true,
                                            artifacts: "*.pdf,*.cczip"
                                            onlyIfSuccessful: false
                        }
                    }
                }
            }
            post {
                always {
                    node( zOsAgentLabel ) {
                        dir("${WORKSPACE}/BUILD-${BUILD_NUMBER}") {
                            archiveArtifacts allowEmptyArchive: true,
                                            artifacts: '**/*.log,**/*.json,**/*.html',
                                            excludes: '**/*clist',
                                            onlyIfSuccessful: false
                        }
                    }
                }
                unstable {
                    script{
                         error ("zUnit tests failed!!!")
                    }
                }
            }
        }

        stage("IDz Code Review") {
            when  { expression { return  idzCodeReviewFlag == true  } }
            steps {
                script{
                    if ( hasBuildFiles ) {
                        def crContent = null
                        node( zOsAgentLabel ) {
                            BUILD_OUTPUT_FOLDER = sh (script: "ls ${WORKSPACE}/BUILD-${BUILD_NUMBER}  | grep build | sort -u", returnStdout: true).trim()
                            sh "$DBB_HOME/bin/groovyz ${WORKSPACE}/dbb/Pipeline/RunIDZCodeReview/RunCodeReview.groovy --workDir ${WORKSPACE}/BUILD-${BUILD_NUMBER}/${BUILD_OUTPUT_FOLDER} -cr  ${WORKSPACE}/cics-genapp/cics-genapp/cr-rules/CodeReviewRules.dat -ccr  ${WORKSPACE}/cics-genapp/cics-genapp/cr-rules/CodeReviewRules.ccr"
                            dir ("${WORKSPACE}/BUILD-${BUILD_NUMBER}/${BUILD_OUTPUT_FOLDER}") {
                                def crJunitFile = fileExists "CodeReviewJUNIT.xml"
                                if ( crJunitFile ) {
                                    crContent = readFile file: "CodeReviewJUNIT.xml"
                                    archiveArtifacts allowEmptyArchive: true,
                                            artifacts: '*.csv,*.xml',
                                            onlyIfSuccessful: false
                                }
                            }
                        }
                        if ( crContent ) {
                            sh "mkdir -p ${WORKSPACE}/BUILD-${BUILD_NUMBER}"
                            writeFile file: "${WORKSPACE}/BUILD-${BUILD_NUMBER}/CodeReviewJUNIT.xml", text:crContent.trim()
                            junit allowEmptyResults: true, testResults: "BUILD-${BUILD_NUMBER}/CodeReviewJUNIT.xml"
                        }
                    }
                }
            }
        }

        stage('UCD Package') {
            steps {
                script {
                    node( zOsAgentLabel ) {
                        if ( hasBuildFiles ) {
                        //  def artiUrl = getArtifactoruUrl(env.ARTIFACTORY_URL)
                            def artiUrl = env.ARTIFACTORY_URL
                            def repositoryPath = env.ARTIFACTORY_REPO_PATH
                      echo "Using Taas IBM Artifactory APIKEY"
                            BUILD_OUTPUT_FOLDER = sh (script: "ls ${WORKSPACE}/BUILD-${BUILD_NUMBER}  | grep build | sort -u", returnStdout: true).trim()
                            dir("${WORKSPACE}/BUILD-${BUILD_NUMBER}/${BUILD_OUTPUT_FOLDER}") {
                                withCredentials([usernamePassword(credentialsId: artiCredentialsId, usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                                    writeFile file: "${WORKSPACE}/BUILD-${BUILD_NUMBER}/artifactoy.properties", encoding: "ibm-1047",
                                       text:"""EXTREPO.PASSWORD=$PASSWORD
EXTREPO.username=$USERNAME
EXTREPO.Repository_type=artifactory
EXTREPO.repository=${repositoryPath}
EXTREPO.url=${artiUrl}
                                      """
                                }
                                echo " Start dbb-ucd-packaging.groovy "
 // password not encrypted, use my own
                         //       sh "cp $HOME/Jenkins-Cloud/workspace/artifactory.properties ${WORKSPACE}/BUILD-${BUILD_NUMBER}/artifactoy.properties"
                                  sh "$dbbHome/bin/groovyz $dbbGroovyzOpts ${WORKSPACE}/dbb/Pipeline/CreateUCDComponentVersion/dbb-ucd-packaging.groovy --buztool ${ucdBuztool} --component ${ucdComponent} --workDir ${WORKSPACE}/BUILD-${BUILD_NUMBER}/${BUILD_OUTPUT_FOLDER} -prop ${WORKSPACE}/BUILD-${BUILD_NUMBER}/artifactoy.properties"
                         //       sh "$dbbHome/bin/groovyz $dbbGroovyzOpts ${WORKSPACE}/dbb-new/Pipeline/CreateUCDComponentVersion/dbb-ucd-packaging.groovy --buztool ${ucdBuztool} --component ${ucdComponent} --workDir ${WORKSPACE}/BUILD-${BUILD_NUMBER}/${BUILD_OUTPUT_FOLDER} -prop /u/proy/Jenkins-Cloud/workspace/GenappPipeline/BUILD-184/artifactoy.properties"

                            }
                        }
                    }
                }
            }
        }

        stage('UCD Deploy') {
            steps {
                script{
echo 'UCD Deploy Starts'
                    if ( hasBuildFiles ) {
                        script{
                            step(
                                  [$class: 'UCDeployPublisher',
                                    deploy: [
                                        deployApp: ucdApplication,
                                        deployDesc: 'Requested from Jenkins',
                                        deployEnv: ucdEnv,
                                        deployOnlyChanged: false,
                                        deployProc: ucdProcess,
                                        deployVersions: ucdComponent + ':latest'],
                                    siteName: ucdSite])
                        }
                    }
                }
            }
        }
     }
  }
