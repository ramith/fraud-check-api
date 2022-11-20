import ballerina/http;
import ballerina/log;


type Payment record {
    string orderId;
    float amount;
    string currency;
    string 'source;
};

type FraudCheckResult record {
    string orderId;
    int fraudScore;
    string fraudStatus;
    string description;
};

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + payment - the payment request
    # + return - an fraud check status or error
    resource function post payment/execute(@http:Payload Payment payment) returns FraudCheckResult|error {
        log:printInfo("fraud check recieved", payment = payment);
        return {
            orderId: payment.orderId,
            fraudScore: 75,
            fraudStatus: "passed",
            description: "fraud check completed successfully"
        };
    }
}
