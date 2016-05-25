var graph_data_uri = "/stock_tickers/{{id}}/graph_data.json";
var id_of_chart_div = "chart1";
var chart1;

$(function() {
  $('#Stock_Tickers').on('change', function() {
    requestStockTickerDataById(parseInt(this.value));
  });
});

// This function initiates a request for json data for a stocker ticker with The
// id of id.  On completion of the ajax request, it will invoke
// populatePageWithDataForGivenTicker... I might refactor later to emit events
// or take in a cb.
function requestStockTickerDataById(id) {
  var resource = graph_data_uri.replace("{{id}}", id);
  var jqxhr = $.ajax( resource )
  .done(function() {
    populatePageWithDataForGivenTicker( jqxhr.responseJSON );
  })
  .fail(function() {
    alert( "Log an error" );
  });
}

// This function takes the supplied json data and populates a chart
// using the chartKick graphing library
function populatePageWithDataForGivenTicker(json) {
  chart1 = new Chartkick.LineChart(id_of_chart_div,
    json.graph_data
  );
}
