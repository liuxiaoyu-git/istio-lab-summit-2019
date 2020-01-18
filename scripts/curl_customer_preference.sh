#!/bin/sh

export CURL_POD=$(oc4 get pods -n istio-tutorial -l app=curl | grep curl | awk '{ print $1}' )
export CUSTOMER_POD=$(oc4 get pods -n istio-tutorial -l app=customer | grep customer | awk '{ print $1}' )

while :; do 

echo "Executing curl in curl pod"
oc4 exec -n istio-tutorial $CURL_POD curl http://preference:8080
echo "---------------------------------------------------------------------------------"
echo "Executing curl in customer pod"
oc4 exec -n istio-tutorial $CUSTOMER_POD -c customer curl http://preference:8080
echo "---------------------------------------------------------------------------------"

done

