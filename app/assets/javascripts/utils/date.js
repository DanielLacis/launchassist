LaunchAssist.Time = function() {
};

LaunchAssist.Time.prototype.monthYear = function(datetime) {
  var MONTHS = {'01': 'January', '02': 'February', '03': 'March', '04': 'April',
  '05': 'May', '06': 'June', '07': 'July', '08': 'August', '09': 'September',
  '10': 'October', '11': 'November', '12': 'December'};
  var year = datetime.slice(0, 4);
  var month = datetime.slice(5, 7);
  month = MONTHS[month];
  return month + ", " + year;
};
