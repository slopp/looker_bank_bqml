# The name of this view in Looker is "Card Transactions"
view: card_transactions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `retail_banking.card_transactions`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Amount" in Explore.

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: cc_number {
    type: number
    sql: ${TABLE}.cc_number ;;
  }

  dimension: epoch_time {
    type: number
    sql: ${TABLE}.epoch_time ;;
  }

  dimension: is_fraud {
    type: yesno
    sql: ${TABLE}.is_fraud ;;
  }

  dimension: merchant {
    type: string
    sql: ${TABLE}.merchant ;;
  }

  dimension: merchant_lat {
    type: number
    sql: ${TABLE}.merchant_lat ;;
  }

  dimension: merchant_lon {
    type: number
    sql: ${TABLE}.merchant_lon ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: trans {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.trans_date ;;
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

  measure: total_amount {
    type: sum
    hidden: yes
    sql: ${amount} ;;
  }

  measure: average_amount {
    type: average
    hidden: yes
    sql: ${amount} ;;
  }

}
