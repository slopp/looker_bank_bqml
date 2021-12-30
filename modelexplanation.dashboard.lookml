- dashboard: retail_fraud_bqml_model_explanation
  title: Retail Fraud BQML Model Explanation
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - name: Model Predictions
    type: text
    title_text: Model Predictions
    subtitle_text: ''
    body_text: "<center>Use the dashboard filters to enter a hypothetical credit card\
      \ transaction and then examine the model predictions to understand the model's\
      \ behavior.</center>\n"
    row: 0
    col: 0
    width: 24
    height: 3
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "***"
    row: 17
    col: 0
    width: 24
    height: 2
  - name: Model Details
    type: text
    title_text: Model Details
    subtitle_text: ''
    body_text: "<center>Overall model metrics for the two models: a logistic regression\
      \ and a boosted tree. Also included is information about the training dataset.\
      \ </center>\n"
    row: 19
    col: 0
    width: 24
    height: 2
  - title: Hypothetical Transaction
    name: Hypothetical Transaction
    model: sl_retail_bank
    explore: model_user_predictions
    type: looker_grid
    fields: [model_user_predictions.card_transactions_amount, model_user_predictions.card_transactions_transaction_distance,
      model_user_predictions.card_transactions_transaction_hour_of_day]
    filters: {}
    sorts: [model_user_predictions.card_transactions_amount]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      model_user_predictions.card_transactions_amount: Amount
      model_user_predictions.card_transactions_transaction_distance: Distance (meters)
      model_user_predictions.card_transactions_transaction_hour_of_day: Hour of Day
    series_value_format:
      model_user_predictions.card_transactions_amount:
        name: usd_0
        decimals: '0'
        format_string: "$#,##0"
        label: U.S. Dollars (0)
        label_prefix: U.S. Dollars
      model_user_predictions.card_transactions_transaction_distance:
        name: decimal_0
        decimals: '0'
        format_string: "#,##0"
        label: Decimals (0)
        label_prefix: Decimals
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Amount: model_user_predictions.amount
      Distance (meters): model_user_predictions.distance
      Hour (0-23): model_user_predictions.hour
    row: 3
    col: 0
    width: 12
    height: 4
  - title: Logistic Regression Prediction
    name: Logistic Regression Prediction
    model: sl_retail_bank
    explore: model_user_predictions
    type: single_value
    fields: [model_user_predictions.predicted_is_fraud]
    filters:
      model_user_predictions.model_name: logistic regression
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#030101"
    single_value_title: Logistic Regression Fraud Prediction
    value_format: ''
    comparison_label: Fraud Prediction
    conditional_formatting: [{type: less than, value: 0.5, background_color: "#EA4335",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: greater than, value: 0.5,
        background_color: "#1A73E8", font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    defaults_version: 1
    series_types: {}
    listen:
      Amount: model_user_predictions.amount
      Distance (meters): model_user_predictions.distance
      Hour (0-23): model_user_predictions.hour
    row: 5
    col: 12
    width: 12
    height: 2
  - title: Boosted Tree Prediction
    name: Boosted Tree Prediction
    model: sl_retail_bank
    explore: model_user_predictions
    type: single_value
    fields: [model_user_predictions.predicted_is_fraud]
    filters:
      model_user_predictions.model_name: boosted tree
    sorts: [model_user_predictions.predicted_is_fraud]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#030101"
    single_value_title: Boosted Tree Fraud Prediction
    value_format: ''
    comparison_label: Fraud Prediction
    conditional_formatting: []
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    defaults_version: 1
    series_types: {}
    listen:
      Amount: model_user_predictions.amount
      Distance (meters): model_user_predictions.distance
      Hour (0-23): model_user_predictions.hour
    row: 3
    col: 12
    width: 12
    height: 2
  - title: Percent Fraud
    name: Percent Fraud
    model: sl_retail_bank
    explore: training_data
    type: looker_pie
    fields: [training_data.count, training_data.is_fraud]
    fill_fields: [training_data.is_fraud]
    sorts: [training_data.is_fraud]
    limit: 500
    value_labels: legend
    label_type: labPer
    inner_radius: 65
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 24
    col: 0
    width: 8
    height: 6
  - title: Prediction Explanation
    name: Prediction Explanation
    model: sl_retail_bank
    explore: model_user_predictions
    type: looker_bar
    fields: [model_user_predictions.feature, model_user_predictions.model_name, contribution_to_prediction_suggests_fraud]
    pivots: [model_user_predictions.model_name]
    filters: {}
    sorts: [model_user_predictions.feature, model_user_predictions.model_name]
    limit: 500
    dynamic_fields: [{category: measure, expression: !!null '', label: Contribution
          to Prediction (+ suggests fraud), value_format: !!null '', value_format_name: !!null '',
        based_on: model_user_predictions.attribution, _kind_hint: measure, measure: contribution_to_prediction_suggests_fraud,
        type: sum, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: model_user_predictions.attribution,
            id: model_user_predictions.attribution, name: Attribution}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    series_colors:
      logistic regression - contribution_to_prediction_suggests_fraud: "#E8710A"
    reference_lines: []
    up_color: "#7CB342"
    down_color: "#EA4335"
    total_color: "#9334E6"
    custom_color_enabled: true
    custom_color: "#030101"
    show_single_value_title: true
    single_value_title: Probability Legitimate
    value_format: '0.00'
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Fraud Prediction
    enable_conditional_formatting: true
    conditional_formatting: [{type: less than, value: 0.5, background_color: "#EA4335",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: greater than, value: 0.5,
        background_color: "#7CB342", font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_null_points: true
    defaults_version: 1
    hidden_fields: []
    listen:
      Amount: model_user_predictions.amount
      Distance (meters): model_user_predictions.distance
      Hour (0-23): model_user_predictions.hour
    row: 7
    col: 0
    width: 24
    height: 8
  - title: Fraud by Time of Day
    name: Fraud by Time of Day
    model: sl_retail_bank
    explore: training_data
    type: looker_column
    fields: [training_data.card_transactions_transaction_hour_of_day, training_data.count]
    filters:
      training_data.is_fraud: 'Yes'
    sorts: [training_data.card_transactions_transaction_hour_of_day]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_label: Hour of Day
    series_types: {}
    series_labels:
      training_data.count: "# of Fraud Trxs"
    show_null_points: true
    defaults_version: 1
    interpolation: linear
    listen: {}
    row: 24
    col: 8
    width: 16
    height: 6
  - title: Transaction Distance (meters)
    name: Transaction Distance (meters)
    model: sl_retail_bank
    explore: training_data
    type: looker_boxplot
    fields: [training_data.is_fraud, training_data.min_trx_distance, training_data.25_trx_distance,
      training_data.50_trx_distance, training_data.75_trx_distance, training_data.max_trx_distance]
    fill_fields: [training_data.is_fraud]
    sorts: [training_data.min_trx_distance desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    listen: {}
    row: 30
    col: 12
    width: 12
    height: 9
  - title: Transaction Amounts ($)
    name: Transaction Amounts ($)
    model: sl_retail_bank
    explore: training_data
    type: looker_boxplot
    fields: [training_data.is_fraud, training_data.min_trx_amount, training_data.25_trx_amount,
      training_data.50_trx_amount, training_data.75_trx_amount, training_data.max_trx_amount]
    fill_fields: [training_data.is_fraud]
    sorts: [training_data.min_trx_amount desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    color_application:
      collection_id: da8306b5-3b46-48aa-9ead-a3b32292f35c
      palette_id: 75905e81-dadc-472c-b9a2-a201f788d55d
      options:
        steps: 5
        reverse: false
    y_axis_max: ['1500']
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 30
    col: 0
    width: 12
    height: 9
  - title: Model Evaluation Overview
    name: Model Evaluation Overview
    model: sl_retail_bank
    explore: model_evaluation_metrics
    type: looker_grid
    fields: [model_evaluation_metrics.model_name, model_evaluation_metrics.accuracy,
      model_evaluation_metrics.roc_auc, model_evaluation_metrics.recall, model_evaluation_metrics.precision,
      model_evaluation_metrics.f1_score, model_evaluation_metrics.log_loss]
    sorts: [model_evaluation_metrics.model_name]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_value_format:
      model_evaluation_metrics.accuracy:
        name: percent_0
        decimals: '0'
        format_string: "#,##0%"
        label: Percent (0)
        label_prefix: Percent
      model_evaluation_metrics.roc_auc:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      model_evaluation_metrics.recall:
        name: percent_0
        decimals: '0'
        format_string: "#,##0%"
        label: Percent (0)
        label_prefix: Percent
      model_evaluation_metrics.precision:
        name: percent_0
        decimals: '0'
        format_string: "#,##0%"
        label: Percent (0)
        label_prefix: Percent
      model_evaluation_metrics.f1_score:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    series_types: {}
    defaults_version: 1
    hidden_fields: [model_evaluation_metrics.log_loss]
    listen: {}
    row: 21
    col: 0
    width: 24
    height: 3
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: This chart can be a little difficult to interpret.  For details see
      [this article](https://cloud.google.com/bigquery-ml/docs/reference/standard-sql/bigqueryml-syntax-xai-overview).
      In general, when reading this chart, compare the magnitude of a feature *within*
      one model and compare the relative directions *across* models.  For example,
      amount has a value of +11 for logistic regression, and distance has a value
      of +1 for logistic regression, than the logistic regression model's prediction
      is being impacted most by amount. If amount has a value of +11 for logistic
      regression, but -2 for binary trees, than this suggests the feature is "voting
      differently" across these two models.
    row: 15
    col: 0
    width: 24
    height: 2
  filters:
  - name: Amount
    title: Amount
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
      options: []
    model: sl_retail_bank
    explore: model_user_predictions
    listens_to_filters: []
    field: model_user_predictions.amount
  - name: Distance (meters)
    title: Distance (meters)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
      options: []
    model: sl_retail_bank
    explore: model_user_predictions
    listens_to_filters: []
    field: model_user_predictions.distance
  - name: Hour (0-23)
    title: Hour (0-23)
    type: field_filter
    default_value: '10'
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - '0'
      - '1'
      - '2'
      - '3'
      - '4'
      - '5'
      - '6'
      - '7'
      - '8'
      - '9'
      - '10'
      - '11'
      - '12'
      - '13'
      - '14'
      - '15'
      - '16'
      - '17'
      - '18'
      - '19'
      - '20'
      - '21'
      - '22'
      - '23'
    model: sl_retail_bank
    explore: model_user_predictions
    listens_to_filters: []
    field: model_user_predictions.hour
