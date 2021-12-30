view: model_evaluation_metrics {
  derived_table: {
    sql: SELECT 'logistic regression' AS model_name, * FROM ML.EVALUATE(MODEL retail_banking.fraud_prediction)
      UNION ALL
      SELECT 'boosted tree' AS model_name, * FROM ML.EVALUATE(MODEL retail_banking.fraud_prediction_bt)
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: model_name {
    type: string
    sql: ${TABLE}.model_name ;;
  }

  dimension: precision {
    type: number
    sql: ${TABLE}.precision ;;
  }

  dimension: recall {
    type: number
    sql: ${TABLE}.recall ;;
  }

  dimension: accuracy {
    type: number
    sql: ${TABLE}.accuracy ;;
  }

  dimension: f1_score {
    type: number
    sql: ${TABLE}.f1_score ;;
  }

  dimension: log_loss {
    type: number
    sql: ${TABLE}.log_loss ;;
  }

  dimension: roc_auc {
    type: number
    sql: ${TABLE}.roc_auc ;;
  }

  set: detail {
    fields: [
      model_name,
      precision,
      recall,
      accuracy,
      f1_score,
      log_loss,
      roc_auc
    ]
  }
}

view: model_user_predictions {
  parameter: distance {
    type: number
    group_label: "What-if Inputs"
    label: "Distance (meters)"
    description: "Hypothetical Transaction Merchant Distance from Cardholder Home"
    default_value: "10"
  }

  parameter: amount {
    type: number
    group_label: "What-if Inputs"
    label: "Amount"
    description: "Hypothetical Transaction Amount"
    default_value: "20"
  }

  parameter: hour {
    type: number
    group_label: "What-if Inputs"
    description: "Hypothetical Transaction Hour of Day values 1-24"
    label: "Hour (1-24)"
    default_value: "11"
  }

  derived_table: {
    sql: SELECT 'logistic regression' AS model_name, * EXCEPT (top_feature_attributions) FROM ML.EXPLAIN_PREDICT(MODEL retail_banking.fraud_prediction, (
      SELECT '001' as trans_id, {% parameter amount %} as card_transactions_amount, {% parameter distance %} as card_transactions_transaction_distance, {% parameter hour %} as card_transactions_transaction_hour_of_day
      ), STRUCT(0.50 AS threshold))
      CROSS JOIN UNNEST(top_feature_attributions)


      UNION ALL


      SELECT 'boosted tree' AS model_name, * EXCEPT (top_feature_attributions) FROM ML.EXPLAIN_PREDICT(MODEL retail_banking.fraud_prediction_bt, (
      SELECT '001' as trans_id, {% parameter amount %}  as card_transactions_amount, {% parameter distance %} as card_transactions_transaction_distance, {% parameter hour %} as card_transactions_transaction_hour_of_day
      ), STRUCT(0.50 AS threshold))
      CROSS JOIN UNNEST(top_feature_attributions)
       ;;
  }


  dimension: model_name {
    type: string
    sql: ${TABLE}.model_name ;;
  }

  dimension: predicted_is_fraud {
    type: string
    sql: ${TABLE}.predicted_is_fraud ;;
  }

  dimension: probability {
    type: number
    sql: ${TABLE}.probability ;;
    value_format_name: percent_0
  }

  dimension: baseline_prediction_value {
    type: number
    sql: ${TABLE}.baseline_prediction_value ;;
  }

  dimension: prediction_value {
    type: number
    sql: ${TABLE}.prediction_value ;;
  }

  dimension: approximation_error {
    type: number
    sql: ${TABLE}.approximation_error ;;
  }

  dimension: trans_id {
    type: string
    sql: ${TABLE}.trans_id ;;
  }

  dimension: card_transactions_amount {
    type: number
    label: "Amount"
    sql: ${TABLE}.card_transactions_amount ;;
  }

  dimension: card_transactions_transaction_distance {
    type: number
    label: "Distance"
    sql: ${TABLE}.card_transactions_transaction_distance ;;
  }

  dimension: card_transactions_transaction_hour_of_day {
    type: number
    label: "Hour"
    sql: ${TABLE}.card_transactions_transaction_hour_of_day ;;
  }

  dimension: feature {
    type: string
    sql: ${TABLE}.feature ;;
  }

  dimension: attribution {
    type: number
    sql: ${TABLE}.attribution ;;
  }

}
