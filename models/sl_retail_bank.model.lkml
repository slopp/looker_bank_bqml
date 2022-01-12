# Define the database connection to be used for this model.
connection: "lopp-bq-retail"

# include all the views
include: "/views/**/*.view"

include: "/modelexplanation.dashboard"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: sl_retail_bank_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: sl_retail_bank_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Sl Retail Bank"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: card_type_facts {}

explore: model_user_predictions {}

explore: model_evaluation_metrics {}

explore: district {}

explore: base_card {
  join: disp {
    type: left_outer
    sql_on: ${base_card.disp_id} = ${disp.disp_id} ;;
    relationship: many_to_one
  }

  join: card {
    type: left_outer
    sql_on: ${base_card.card_id} = ${card.card_id} ;;
    relationship: many_to_one
  }

  join: account {
    type: left_outer
    sql_on: ${disp.account_id} = ${account.account_id} ;;
    relationship: many_to_one
  }

  join: client {
    type: left_outer
    sql_on: ${disp.client_id} = ${client.client_id} ;;
    relationship: many_to_one
  }

  join: district {
    type: left_outer
    sql_on: ${account.district_id} = ${district.district_id} ;;
    relationship: many_to_one
  }
}

explore: account {
  join: district {
    type: left_outer
    sql_on: ${account.district_id} = ${district.district_id} ;;
    relationship: many_to_one
  }
}

explore: disp {
  join: account {
    type: left_outer
    sql_on: ${disp.account_id} = ${account.account_id} ;;
    relationship: many_to_one
  }

  join: client {
    type: left_outer
    sql_on: ${disp.client_id} = ${client.client_id} ;;
    relationship: many_to_one
  }

  join: district {
    type: left_outer
    sql_on: ${account.district_id} = ${district.district_id} ;;
    relationship: many_to_one
  }
}

explore: client {
  join: district {
    type: left_outer
    sql_on: ${client.district_id} = ${district.district_id} ;;
    relationship: many_to_one
  }

  join: disp {
    type: left_outer
    sql_on: ${client.disp_id} = ${disp.disp_id} ;;
    relationship: many_to_one
  }

  join: account {
    type: left_outer
    sql_on: ${disp.account_id} = ${account.account_id} ;;
    relationship: many_to_one
  }
}

explore: card {
  join: disp {
    type: left_outer
    sql_on: ${card.disp_id} = ${disp.disp_id} ;;
    relationship: many_to_one
  }

  join: account {
    type: left_outer
    sql_on: ${disp.account_id} = ${account.account_id} ;;
    relationship: many_to_one
  }

  join: client {
    type: left_outer
    sql_on: ${disp.client_id} = ${client.client_id} ;;
    relationship: many_to_one
  }

  join: district {
    type: left_outer
    sql_on: ${account.district_id} = ${district.district_id} ;;
    relationship: many_to_one
  }
}

explore: card_transactions {}

explore: training_data {}

explore: order {
  join: account {
    type: left_outer
    sql_on: ${order.account_id} = ${account.account_id} ;;
    relationship: many_to_one
  }

  join: district {
    type: left_outer
    sql_on: ${account.district_id} = ${district.district_id} ;;
    relationship: many_to_one
  }
}

explore: loan {
  join: account {
    type: left_outer
    sql_on: ${loan.account_id} = ${account.account_id} ;;
    relationship: many_to_one
  }

  join: district {
    type: left_outer
    sql_on: ${account.district_id} = ${district.district_id} ;;
    relationship: many_to_one
  }
}
