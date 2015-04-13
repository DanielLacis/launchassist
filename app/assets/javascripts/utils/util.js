LaunchAssist.Util = function() {
};

LaunchAssist.Util.prototype.monthYear = function(datetime) {
  var MONTHS = {'01': 'January', '02': 'February', '03': 'March', '04': 'April',
  '05': 'May', '06': 'June', '07': 'July', '08': 'August', '09': 'September',
  '10': 'October', '11': 'November', '12': 'December'};
  var year = datetime.slice(0, 4);
  var month = datetime.slice(5, 7);
  month = MONTHS[month];
  return month + ", " + year;
};

LaunchAssist.Util.prototype.numberWithCommas = function (x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
};

LaunchAssist.Util.prototype.processGoal = function(inputStr) {
  if (typeof inputStr !== 'string') {
    return inputStr;
  }
  return Math.floor(inputStr.replace(/[$,]/g, ''));
};

LaunchAssist.Util.prototype.processEndDate = function(inputStr) {
  if (typeof inputStr !== 'string' || inputStr[2] !== '/') {
    return inputStr;
  }
  return inputStr.slice(6, 10) + '-' + inputStr.slice(0, 2) + '-' +
         inputStr.slice(3, 5);
};
