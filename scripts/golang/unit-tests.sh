######################################################################################
# File: unit-tests.sh                                                                #
# Description: This files runs the unit test and stro the result location            #
######################################################################################

# set the GO run enviroment
source ./pipeline-repo/scripts/golang/go-run-time.sh
# Get the GO plugin for junit test results
go get -u github.com/jstemmer/go-junit-report

# convert the unit test results to the junit format 
go test ./... -v 2>&1 | go-junit-report > report.xml

# get the GO plugin for cobertura result format
go get github.com/t-yuki/gocover-cobertura

# Run the code coverage
go test ./... -coverprofile=cover.out

# convert the code coverage test result to coberture format
gocover-cobertura < cover.out > coverage.xml

# complete file location of the unit test result 
UNIT_TEST_RESULTS_LOC=report.xml
