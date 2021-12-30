# The name of this view in Looker is "Base Card"
view: base_card {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `retail_banking.base_card`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Card ID" in Explore.

  dimension: card_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.card_id ;;
  }

  dimension: card_number {
    type: number
    sql: ${TABLE}.card_number ;;
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

  dimension: disp_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.disp_id ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_date ;;
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
    drill_fields: [disp.disp_id, card.card_id]
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_card_number {
    type: sum
    hidden: yes
    sql: ${card_number} ;;
  }

  measure: average_card_number {
    type: average
    hidden: yes
    sql: ${card_number} ;;
  }
}
