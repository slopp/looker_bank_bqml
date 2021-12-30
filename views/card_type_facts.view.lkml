# The name of this view in Looker is "Card Type Facts"
view: card_type_facts {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `retail_banking.card_type_facts`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Annual Fee" in Explore.

  dimension: annual_fee {
    type: number
    sql: ${TABLE}.annual_fee ;;
  }

  dimension: daily_interest_rate {
    type: number
    sql: ${TABLE}.daily_interest_rate ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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

  measure: total_annual_fee {
    type: sum
    hidden: yes
    sql: ${annual_fee} ;;
  }

  measure: average_annual_fee {
    type: average
    hidden: yes
    sql: ${annual_fee} ;;
  }

  measure: total_daily_interest_rate {
    type: sum
    hidden: yes
    sql: ${daily_interest_rate} ;;
  }

  measure: average_daily_interest_rate {
    type: average
    hidden: yes
    sql: ${daily_interest_rate} ;;
  }
}
