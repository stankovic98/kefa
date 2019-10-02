#!/usr/bin/env bash

here=$(pwd)

# unit test the code
go test || exit

# build binaries
cd $here/test
GOOS=linux go build -o apitest || exit
cd $here
GOOS=linux go build -o kefa || exit

sudo docker system prune -f --volumes

sudo docker-compose up --build -d

# run test
test_output=$(sudo docker wait api_test_1)

# collect logs
sudo docker logs api_kefa_1 &> kefa.log
sudo docker logs api_test_1 &> test.log

#results
echo
cat api.log
echo
cat test.log
if [[ "$test_output" != "0" ]]
then
    echo "***************************************************"
    echo "***               TESTS FAILED                  ***"
    echo "***************************************************"
else
    echo "==================================================="
    echo "===               TESTS PASSED                  ==="
    echo "==================================================="
fi

# clean up
sudo docker-compose down
sudo docker ps -a
rm kefa test/apitest