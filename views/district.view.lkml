# The name of this view in Looker is "District"
view: district {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `retail_banking.district`
    ;;
  drill_fields: [district_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: district_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.district_id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Avgsal" in Explore.

  dimension: avgsal {
    type: number
    sql: ${TABLE}.avgsal ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: ent_ppt {
    type: number
    sql: ${TABLE}.ent_ppt ;;
  }

  dimension: ncit {
    type: number
    sql: ${TABLE}.ncit ;;
  }

  dimension: ncri95 {
    type: string
    sql: ${TABLE}.ncri95 ;;
  }

  dimension: ncri96 {
    type: number
    sql: ${TABLE}.ncri96 ;;
  }

  dimension: nmu10k {
    type: number
    sql: ${TABLE}.nmu10k ;;
  }

  dimension: nmu2k {
    type: number
    sql: ${TABLE}.nmu2k ;;
  }

  dimension: nmu500 {
    type: number
    sql: ${TABLE}.nmu500 ;;
  }

  dimension: nmuinf {
    type: number
    sql: ${TABLE}.nmuinf ;;
  }

  dimension: pop {
    type: number
    sql: ${TABLE}.pop ;;
  }

  dimension: rurba {
    type: number
    sql: ${TABLE}.rurba ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: urat95 {
    type: string
    sql: ${TABLE}.urat95 ;;
  }

  dimension: urat96 {
    type: number
    sql: ${TABLE}.urat96 ;;
  }

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.zipcode ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [district_id, account.count, client.count]
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_avgsal {
    type: sum
    hidden: yes
    sql: ${avgsal} ;;
  }

  measure: average_avgsal {
    type: average
    hidden: yes
    sql: ${avgsal} ;;
  }

  measure: total_ent_ppt {
    type: sum
    hidden: yes
    sql: ${ent_ppt} ;;
  }

  measure: average_ent_ppt {
    type: average
    hidden: yes
    sql: ${ent_ppt} ;;
  }

  measure: total_ncit {
    type: sum
    hidden: yes
    sql: ${ncit} ;;
  }

  measure: average_ncit {
    type: average
    hidden: yes
    sql: ${ncit} ;;
  }

  measure: total_ncri96 {
    type: sum
    hidden: yes
    sql: ${ncri96} ;;
  }

  measure: average_ncri96 {
    type: average
    hidden: yes
    sql: ${ncri96} ;;
  }

  measure: total_nmu10k {
    type: sum
    hidden: yes
    sql: ${nmu10k} ;;
  }

  measure: average_nmu10k {
    type: average
    hidden: yes
    sql: ${nmu10k} ;;
  }

  measure: total_nmu2k {
    type: sum
    hidden: yes
    sql: ${nmu2k} ;;
  }

  measure: average_nmu2k {
    type: average
    hidden: yes
    sql: ${nmu2k} ;;
  }

  measure: total_nmu500 {
    type: sum
    hidden: yes
    sql: ${nmu500} ;;
  }

  measure: average_nmu500 {
    type: average
    hidden: yes
    sql: ${nmu500} ;;
  }

  measure: total_nmuinf {
    type: sum
    hidden: yes
    sql: ${nmuinf} ;;
  }

  measure: average_nmuinf {
    type: average
    hidden: yes
    sql: ${nmuinf} ;;
  }

  measure: total_pop {
    type: sum
    hidden: yes
    sql: ${pop} ;;
  }

  measure: average_pop {
    type: average
    hidden: yes
    sql: ${pop} ;;
  }

  measure: total_rurba {
    type: sum
    hidden: yes
    sql: ${rurba} ;;
  }

  measure: average_rurba {
    type: average
    hidden: yes
    sql: ${rurba} ;;
  }

  measure: total_urat96 {
    type: sum
    hidden: yes
    sql: ${urat96} ;;
  }

  measure: average_urat96 {
    type: average
    hidden: yes
    sql: ${urat96} ;;
  }
}
