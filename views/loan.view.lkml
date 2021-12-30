# The name of this view in Looker is "Loan"
view: loan {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `retail_banking.loan`
    ;;
  drill_fields: [loan_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: loan_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.loan_id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Account ID" in Explore.

  dimension: account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: duration {
    type: number
    sql: ${TABLE}.duration ;;
  }

  dimension: payments {
    type: number
    sql: ${TABLE}.payments ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [loan_id, account.account_id]
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

  measure: total_duration {
    type: sum
    hidden: yes
    sql: ${duration} ;;
  }

  measure: average_duration {
    type: average
    hidden: yes
    sql: ${duration} ;;
  }

  measure: total_payments {
    type: sum
    hidden: yes
    sql: ${payments} ;;
  }

  measure: average_payments {
    type: average
    hidden: yes
    sql: ${payments} ;;
  }
}
