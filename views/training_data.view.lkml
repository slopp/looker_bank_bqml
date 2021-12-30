# The name of this view in Looker is "Training Data"
view: training_data {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `retail_banking.training_data`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Card Transactions Amount" in Explore.

  dimension: card_transactions_amount {
    type: number
    sql: ${TABLE}.card_transactions_amount ;;
  }

  dimension: card_transactions_transaction_distance {
    type: number
    sql: ${TABLE}.card_transactions_transaction_distance ;;
  }

  dimension: card_transactions_transaction_hour_of_day {
    type: number
    sql: ${TABLE}.card_transactions_transaction_hour_of_day ;;
  }

  dimension: is_fraud {
    type: yesno
    sql: ${TABLE}.is_fraud ;;
  }

  dimension: trans_id {
    type: string
    sql: ${TABLE}.trans_id ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: []
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_card_transactions_amount {
    type: sum
    hidden: yes
    sql: ${card_transactions_amount} ;;
  }

  measure: average_card_transactions_amount {
    type: average
    label: "Avg Trx Amount"
    sql: ${card_transactions_amount} ;;
  }

  measure: total_card_transactions_transaction_distance {
    type: sum
    hidden: yes
    sql: ${card_transactions_transaction_distance} ;;
  }

  measure: average_card_transactions_transaction_distance {
    type: average
    label: "Avg Trx Dist"
    sql: ${card_transactions_transaction_distance} ;;
  }

  measure: total_card_transactions_transaction_hour_of_day {
    type: sum
    hidden: yes
    sql: ${card_transactions_transaction_hour_of_day} ;;
  }

  measure: average_card_transactions_transaction_hour_of_day {
    type: average
    label: "Avg Trx Hour"
    sql: ${card_transactions_transaction_hour_of_day} ;;
  }

  # measures for boxplot on amount

  measure: 25_trx_amount {
    type: percentile
    percentile: 25
    sql: ${card_transactions_amount} ;;
  }

  measure: 50_trx_amount {
    type: percentile
    percentile: 50
    sql: ${card_transactions_amount} ;;
  }

  measure: 75_trx_amount {
    type: percentile
    percentile: 75
    sql: ${card_transactions_amount} ;;
  }

  measure: min_trx_amount {
    type: min
    sql: ${card_transactions_amount} ;;
  }

  measure: max_trx_amount {
    type: max
    sql: ${card_transactions_amount} ;;
  }

  # measures for boxplot on distance
  measure: 25_trx_distance {
    type: percentile
    percentile: 25
    sql: ${card_transactions_transaction_distance} ;;
  }

  measure: 50_trx_distance {
    type: percentile
    percentile: 50
    sql: ${card_transactions_transaction_distance} ;;
  }

  measure: 75_trx_distance {
    type: percentile
    percentile: 75
    sql: ${card_transactions_transaction_distance} ;;
  }

  measure: min_trx_distance {
    type: min
    sql: ${card_transactions_transaction_distance} ;;
  }

  measure: max_trx_distance {
    type: max
    sql: ${card_transactions_transaction_distance} ;;
  }
}
