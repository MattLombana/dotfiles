idrac6() {
    if [ $# -ne 3 ]; then
        echo "Usage: idrac6 <host> <user> <password>"
        return
    fi
    docker run --rm -d -p 5800:5800 --name idrac6 -e IDRAC_HOST=$1 -e IDRAC_USER=$2 -e IDRAC_PASSWORD=$3 domistyle/idrac6
    echo 'Please visit http://localhost:5800'
}
