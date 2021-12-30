# The name of this view in Looker is "Disp"
view: disp {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `retail_banking.disp`
    ;;
  drill_fields: [disp_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: disp_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.disp_id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Account ID" in Explore.

  dimension: account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
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
    drill_fields: [detail*]
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      disp_id,
      account.account_id,
      client.last_name,
      client.client_id,
      client.first_name,
      base_card.count,
      client.count,
      card.count
    ]
  }
}
