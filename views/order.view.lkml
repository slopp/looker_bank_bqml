# The name of this view in Looker is "Order"
view: order {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `retail_banking.order`
    ;;
  drill_fields: [order_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Account ID" in Explore.

  dimension: account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_to {
    type: number
    sql: ${TABLE}.account_to ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: bank_to {
    type: string
    sql: ${TABLE}.bank_to ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [order_id, account.account_id]
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_account_to {
    type: sum
    hidden: yes
    sql: ${account_to} ;;
  }

  measure: average_account_to {
    type: average
    hidden: yes
    sql: ${account_to} ;;
  }

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
