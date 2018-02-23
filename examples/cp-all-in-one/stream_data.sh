OFFSET=0
while true;
do
    let OFFSET=OFFSET+1
    psql -h localhost -p 5432 -U postgres connect_test > /dev/null <<-EOF 
    INSERT INTO test (name, email, department) VALUES ('alice-$OFFSET', 'alice@abc.com', 'engineering');
EOF
sleep 0.01
echo $OFFSET
done