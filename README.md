
This project demonstrates a "what-if" scenario tool for explaining model predictions.

### Data

The data comes from a fictional retail banking dataset that includes a set of credit card transactions labelled with a fraud indicator. For details see: go/bq-compete-demo


### Model

Two models are built off the same training data that predict whether a credit card transaction is fraudalent based on:

- Distance from the credit card holder's address
- Amount
- Hour of the day

Both models are fit with BQML default arguments with a slight modification toa ccount for the significant class inbalance.


CREATE OR REPLACE MODEL retail_banking.fraud_prediction
OPTIONS(model_type='logistic_reg', labels=['is_fraud']) AS
SELECT * EXCEPT(trans_id)
FROM retail_banking.training_data
WHERE (is_fraud IS TRUE) OR
(is_fraud IS NOT TRUE AND rand() <=
(SELECT COUNTIF(is_fraud)/COUNT(*) FROM retail_banking.training_data));



CREATE OR REPLACE MODEL retail_banking.fraud_prediction_bt
OPTIONS(model_type='BOOSTED_TREE_CLASSIFIER', labels=['is_fraud']) AS
SELECT * EXCEPT(trans_id)
FROM retail_banking.training_data
WHERE (is_fraud IS TRUE) OR
(is_fraud IS NOT TRUE AND rand() <=
(SELECT COUNTIF(is_fraud)/COUNT(*) FROM retail_banking.training_data));



### Key Patterns

The dashboard allows users to supply values for the three predictors to create a hypothetical transaction, and then pass those parameters to ML.EXPLAIN_PREDICT in order to evaluate the model predictions and determine feature attribution.
