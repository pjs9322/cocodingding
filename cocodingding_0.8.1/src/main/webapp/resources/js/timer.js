        var iSecond;
        var timerchecker = null;
        window.onload = function () {
            fncClearTime();
            initTimer();
        }

        function fncClearTime() {
            iSecond = 01;               //시간. 카운트 업할땐 01로 설정 // 카운터 다운할땐 원하는 시간 설정. 30분이면 1800 입력.
        }

        Lpad = function (str, len) {
            str = str + "";
            while (str.length < len) {
                str = "0" + str;
            }
            return str;
        }

        initTimer = function () {
            var timer = document.getElementById("timer");
            rHour = parseInt(iSecond / 3600);
            rHour = rHour % 60;
            rMinute = parseInt(iSecond / 60);
            rMinute = rMinute % 60;
            rSecond = iSecond % 60;

            if (iSecond >= 0) {
                timer.innerHTML = Lpad(rMinute, 2)
                    + "분 " + Lpad(rSecond, 2) + "초 ";
                iSecond++;  //++하면 카운트가 늘어나고 --는 카운터가 줄어든다.
                timerchecker = setTimeout("initTimer()", 1000); 
            } else {
                clearInterval(initTimer);
            }
        }


        function refreshTimer() {
            var xhr = initAjax();
            xhr.open("POST", "/jsp_std/kor/util/window_reload2.jsp", false);
            xhr.send();
            fncClearTime();
        }

        function logoutUser() {
            clearTimeout(timerchecker);
            var xhr = initAjax();
            xhr.open("POST", "/mail/user.public.do?method=logout", false);
            xhr.send();
            location.reload();
        }

        function initAjax() { 
            var xmlhttp;
            if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            } else {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            return xmlhttp;
        }