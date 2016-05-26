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



// This function will take the existing data in chart1, and add the dataPoint
// passed into to, then create a brand new chart out of the data
// Parameters:
//   chartObject: An instantiation of Chartkick.LineChart
//   dataPoint:   A JSON hash container any number of Date: Decimal pairs.
//
// example:  addDatapointToChart(chart1, JSON.parse("{\"2016-05-25T00:00:00-07:00\": \"99.99\"}"))
function addDatapointToChart(chartObject, dataPoint) {
  var addition = merge_options(chart1.dataSource, dataPoint);

  // debugger;
  chart1 = new Chartkick.LineChart(chartObject.element.id,
    addition
  );
}


/**
 * Overwrites obj1's values with obj2's and adds obj2's if non existent in obj1
 * @param obj1
 * @param obj2
 * @returns obj3 a new object based on obj1 and obj2
 */
function merge_options(obj1,obj2){
    var obj3 = {};
    for (var attrname in obj1) { obj3[attrname] = obj1[attrname]; }
    for (var attrname in obj2) { obj3[attrname] = obj2[attrname]; }
    return obj3;
}
