<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css">
	<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/toast/css/tui-calendar.css" />

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/toast/css/calendar/default.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/toast/css/calendar/icons.css" /> 
<title>Insert title here</title>
</head>
<body>
  <main id="main" class="main">
  <div class="code-html">
    <div id="menu">
      <span id="menu-navi">
        <button type="button" class="btn btn-default btn-sm move-today" data-action="move-today">Today</button>
        <button type="button" class="btn btn-default btn-sm move-day" data-action="move-prev">
          <i class="calendar-icon ic-arrow-line-left" data-action="move-prev"></i>
        </button>
        <button type="button" class="btn btn-default btn-sm move-day" data-action="move-next">
          <i class="calendar-icon ic-arrow-line-right" data-action="move-next"></i>
        </button>
      </span>
      <span id="renderRange" class="render-range"></span>
    </div>

    <div id="calendar"></div>
  </div>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
      crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  <script src="https://uicdn.toast.com/tui.code-snippet/v1.5.2/tui-code-snippet.min.js"></script>
  <script src="https://uicdn.toast.com/tui.time-picker/v2.0.3/tui-time-picker.min.js"></script>
  <script src="https://uicdn.toast.com/tui.date-picker/v4.0.3/tui-date-picker.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/chance/1.0.13/chance.min.js"></script>
  
  <script src="${pageContext.request.contextPath}/assets/toast/js/tui-calendar.js"></script>
  <script src="${pageContext.request.contextPath}/assets/toast/data/calendars.js"></script>
  <script src="${pageContext.request.contextPath}/assets/toast/data/schedules.js"></script>
 
 <script>
  var templates = {
    popupIsAllDay: function() {
      return 'All Day';
    },
    popupStateFree: function() {
      return 'Free';
    },
    popupStateBusy: function() {
      return 'Busy';
    },
    titlePlaceholder: function() {
      return 'Subject';
    },
    locationPlaceholder: function() {
      return 'Location';
    },
    startDatePlaceholder: function() {
      return 'Start date';
    },
    endDatePlaceholder: function() {
      return 'End date';
    },
    popupSave: function() {
      return 'Save';
    },
    popupUpdate: function() {
      return 'Update';
    },
    popupDetailDate: function(isAllDay, start, end) {
      var isSameDate = moment(start).isSame(end);
      var endFormat = (isSameDate ? '' : 'YYYY.MM.DD ') + 'hh:mm a';

      if (isAllDay) {
        return moment(start).format('YYYY.MM.DD') + (isSameDate ? '' : ' - ' + moment(end).format('YYYY.MM.DD'));
      }

      return (moment(start).format('YYYY.MM.DD hh:mm a') + ' - ' + moment(end).format(endFormat));
    },
    popupDetailLocation: function(schedule) {
      return 'Location : ' + schedule.location;
    },
    popupDetailUser: function(schedule) {
      return 'User : ' + (schedule.attendees || []).join(', ');
    },
    popupDetailState: function(schedule) {
      return 'State : ' + schedule.state || 'Busy';
    },
    popupDetailRepeat: function(schedule) {
      return 'Repeat : ' + schedule.recurrenceRule;
    },
    popupDetailBody: function(schedule) {
      return 'Body : ' + schedule.body;
    },
    popupEdit: function() {
      return 'Edit';
    },
    popupDelete: function() {
      return 'Delete';
    }
  };

  var cal = new tui.Calendar('#calendar', {
    defaultView: 'month',
    template: templates,
    useCreationPopup: true,
    useDetailPopup: true
  });
  </script>
  <script src="${pageContext.request.contextPath}/assets/toast/js/calendar/default.js"></script>
</main>
</body>
</html>