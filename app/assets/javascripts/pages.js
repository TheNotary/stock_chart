// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {

  $('select').on('change', function() {
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
    populatePageWithDataForGivenTicker( jqxhr.responseJSON.name );
  })
  .fail(function() {
    alert( "Log an error" );
  });
}

// This function takes the supplied json data and populates w/e graphing library
// I roll with on this project (TBD)
function populatePageWithDataForGivenTicker(json) {
  alert( json.name );
}
