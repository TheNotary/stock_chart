
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
  var jqxhr = $.ajax( "/stock_tickers/" + id + ".json" )
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
  var chart1 = new Chartkick.LineChart("chart1",
    json.graph_data
  );
}
