// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//  # remark! # require chartkick
//= require jquery
//= require jquery_ujs
//= require faye
//= require_tree .


// popular turbolinks compliant pattern
function pageChanged() {
  window.fayecom = new Fayecom({
    fayecom_address: document.getElementsByName('fayecom_address')[0].getAttribute("content"),
    fayecom_protocol: document.getElementsByName('fayecom_protocol')[0].getAttribute("content"),
    fayecomPort: document.getElementsByName('fayecom_port')[0].getAttribute("content"),
  });

  fayecom.subscriptions.add('/save_kittens/data/fresh_data', on_freshDataReciept);
}


// Callback for when data is published to the subscribed channel
function on_freshDataReciept(message) {
  // alert("GOT SOME DATA: " + message);
  addDatapointToChart(chart1, JSON.parse(message));
}



// This is a really handy function for inspecting javascript objects!
function xinspect(o,i){
  if(typeof i=='undefined')i='';
  if(i.length>50)return '[MAX ITERATIONS]';
  var r=[];
  for(var p in o){
      var t=typeof o[p];
      r.push(i+'"'+p+'" ('+t+') => '+(t=='object' ? 'object:'+xinspect(o[p],i+'  ') : o[p]+''));
  }
  return r.join(i+'\n');
}
