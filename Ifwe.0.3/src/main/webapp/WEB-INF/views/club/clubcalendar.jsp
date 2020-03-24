<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Calendar</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<script src="https://kit.fontawesome.com/5e1e16b3f4.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/club/clubinclude.css">
<link href='${pageContext.request.contextPath }/resources/fullcalendar/core/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath }/resources/fullcalendar/daygrid/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath }/resources/fullcalendar/list/main.css' rel='stylesheet' />

<script src='${pageContext.request.contextPath }/resources/fullcalendar/core/main.js'></script>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/daygrid/main.js'></script>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/interaction/main.js'></script>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/list/main.js'></script>
   
 <script>
 $(function(){
	 console.log("야야야ㅇㄹㅇㄹ");
 })
   document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,listWeek'
    },
  	buttonTex:{
  		today:"오늘",
  		month:"월별",
  		listWeek:"일정목록"
  	},
    defaultDate: '2020-03-12',
    navLinks: true, // can click day/week names to navigate views
    selectable: true,
    selectMirror: true,
    editalbe: true,
    select: function(arg) {
      var title = prompt('일정을 입력해주세요:');
      if (title) {
        calendar.addEvent({
          title: title,
          start: arg.start,
          end: arg.end,
          allDay: arg.allDay
        })
      }
      calendar.unselect()
    },
    editable: true,
    eventLimit: true, // allow "more" link when too many events
    events: [
      {
        title: 'All Day Event',
        start: '2020-03-01'
      },
      {
        title: 'Long Event',
        start: '2020-03-07',
        end: '2020-03-10'
      },
      {
        groupId: 999,
        title: 'Repeating Event',
        start: '2020-03-09T16:00:00'
      },
      {
        groupId: 999,
        title: 'Repeating Event',
        start: '2020-03-16T16:00:00'
      },
      {
        title: 'Conference',
        start: '2020-03-11',
        end: '2020-03-13'
      },
      {
        title: 'Meeting',
        start: '2020-03-12T10:30:00',
        end: '2020-03-12T12:30:00'
      },
      {
        title: 'Lunch',
        start: '2020-03-12T12:00:00'
      },
      {
        title: 'Meeting',
        start: '2020-03-12T14:30:00'
      },
      {
        title: 'Happy Hour',
        start: '2020-03-12T17:30:00'
      },
      {
        title: 'Dinner',
        start: '2020-03-12T20:00:00'
      },
      {
        title: 'Birthday Party',
        start: '2020-03-13T07:00:00'
      },
      {
        title: 'Click for Google',
        url: 'http://google.com/',
        start: '2020-03-28'
      }
    ],
    locale:'ko',
    eventClick: function (event, jsEvent, view) {
  	    editEvent(event);
  	  },

  	  locale: 'ko',
  	  timezone: "local",
  	  nextDayThreshold: "09:00:00",
  	  allDaySlot: true,
  	  displayEventTime: true,
  	  displayEventEnd: true,
  	  firstDay: 0, //월요일이 먼저 오게 하려면 1
  	  weekNumbers: false,
  	  selectable: true,
  	  weekNumberCalculation: "ISO",
  	  eventLimit: true,
  	  views: {
  	    month: {
  	      eventLimit: 12
  	    }
  	 }
  });

  calendar.render();
});
  </script>
<style>
.section-boradmenu{
	font-family: 'GmarketSansMedium';
	font-weight: bold;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/clubInclude.jsp"></jsp:include>
            <section class="flotclass">
                <div class="section-block">
                    <div class="section-wrapper">
                        <p class="section-boradmenu">일정캘린더</p>
                       
                    </div>
                        <div class="calendar-wrapper">
                            <div id="calendar"></div>
                        </div>
                </div>
                








                
                
            </section>
            
            
            
            
            
            
            
            
            
            
            
            
        </div>
    </div>
</body>
</html>
