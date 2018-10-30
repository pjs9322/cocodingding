// function sendIt() {
//     var email = document.f.my_add.value;
//     var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
//     var msg, ss, cc;
//     // 아이디 입력여부 검사
//     if (f.my_id.value == "") {
//         alert("아이디를 입력하지 않았습니다.")
//         f.my_id.focus()
//         return false;
//     }
//     //아이디 유효성 검사 (영문소문자, 숫자만 허용)
//     for (i = 0; i < document.f.my_id.value.length; i++) {
//         ch = document.f.my_id.value.charAt(i)
//         if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z')) {
//             alert("아이디는 대소문자, 숫자만 입력가능합니다.")
//             document.f.my_id.focus()
//             document.f.my_id.select()
//             return false;
//         }
//     }
//     //아이디에 공백 사용하지 않기
//     if (document.f.my_id.value.indexOf(" ") >= 0) {
//         alert("아이디에 공백을 사용할 수 없습니다.")
//         document.f.my_id.focus()
//         document.f.my_id.select()
//         return false;
//     }
//     //아이디 길이 체크 (4~12자)
//     if (document.f.my_id.value.length < 6 || document.f.my_id.value.length > 12) {
//         alert("아이디를 6~12자까지 입력해주세요.")
//         document.f.my_id.focus()
//         document.f.my_id.select()
//         return false;
//     }
//     //비밀번호 입력여부 체크
//     if (document.f.my_pwd.value == "") {
//         alert("비밀번호를 입력하지 않았습니다.")
//         document.f.my_pwd.focus()
//         return false;
//     }
//     if (f.my_pwd.value == f.my_id.value) {
//         alert("아이디와 비밀번호가 같습니다.")
//         document.f.my_pwd.focus()
//         return false;
//     }
    
//     //비밀번호 길이 체크(4~8자 까지 허용)
//     if (document.f.my_pwd.value.length < 4 || document.f.my_pwd.value.length > 12) {
//         alert("비밀번호를 4~12자까지 입력해주세요.")
//         document.f.my_pwd.focus()
//         document.f.my_pwd.select()
//         return false;
//     }

//     //비밀번호와 비밀번호 확인 일치여부 체크
//     if (document.f.my_pwd.value != document.f.my_pwd1.value) {
//         alert("비밀번호가 일치하지 않습니다")
//         document.f.my_pwd1.value = ""
//         document.f.my_pwd1.focus()
//         return false;
//     }

//     //닉네임 유효성 검사 (영문소문자, 숫자만 허용)
//     for (i = 0; i < document.f.my_nick.value.length; i++) {
//         ch = document.f.my_id.value.charAt(i)
//         if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z')) {
//             alert("닉네임은 대소문자, 숫자만 입력가능합니다.")
//             document.f.my_id.focus()
//             document.f.my_id.select()
//             return false;
//         }
//     }

//     //닉네임에 공백 사용하지 않기
//     if (document.f.my_nick.value.indexOf(" ") >= 0) {
//         alert("닉네임에 공백을 사용할 수 없습니다.")
//         document.f.my_nick.focus()
//         document.f.my_nick.select()
//         return false;
//     }
//     //닉네임 길이 체크 (4~12자)
//     if (document.f.my_nick.value.length < 2 || document.f.my_nick.value.length > 6) {
//         alert("닉네임을 2~6자까지 입력해주세요.")
//         document.f.my_nick.focus()
//         document.f.my_nick.select()
//         return false;
//     }

//     if (document.f.my_add.value == "") {
//         alert("이메일을 입력하지 않았습니다.")
//         document.f.my_add.focus()
//         return false;
//     }


//     if (regex.test(email) === false) {
//         alert("잘못된 이메일 형식입니다.");
//         document.f.my_add.value = ""
//         document.f.my_add.focus()
//         return false;
//     }
// }



function sendIt() {
    var email = document.f.my_add.value;
    var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
      var msg, ss, cc;
    //아이디 입력여부 검사
    if (f.my_id.value == "") {
        alert("아이디를 입력하지 않았습니다.")
        f.my_id.focus()
        return false;
    }
    //아이디 유효성 검사 (영문소문자, 숫자만 허용)
    for (i = 0; i < document.f.my_id.value.length; i++) {
        ch = document.f.my_id.value.charAt(i)
        if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
            alert("아이디는 대소문자, 숫자만 입력가능합니다.")
            document.f.my_id.focus()
            document.f.my_id.select()
            return false;
        }
    }
    //아이디에 공백 사용하지 않기
    if (document.f.my_id.value.indexOf(" ") >= 0) {
        alert("아이디에 공백을 사용할 수 없습니다.")
        document.f.my_id.focus()
        document.f.my_id.select()
        return false;
    }
    //아이디 길이 체크 (4~12자)
    if (document.f.my_id.value.length<4 || document.f.my_id.value.length>12) {
        alert("아이디를 4~12자까지 입력해주세요.")
        document.f.my_id.focus()
        document.f.my_id.select()
        return false;
    }
    //비밀번호 입력여부 체크
    if (document.f.my_pwd.value == "") {
        alert("비밀번호를 입력하지 않았습니다.")
        document.f.my_pwd.focus()
        return false;
    }
    if (f.my_pwd.value == f.my_id.value) {
        alert("아이디와 비밀번호가 같습니다.")
        document.f.my_pwd.focus()
        return false;
    }
    //비밀번호 길이 체크(4~8자 까지 허용)
    if (document.f.my_pwd.value.length<4 || document.f.my_pwd.value.length>12) {
        alert("비밀번호를 4~12자까지 입력해주세요.")
        document.f.my_pwd.focus()
        document.f.my_pwd.select()
        return false;
    }

    //비밀번호와 비밀번호 확인 일치여부 체크
    if (document.f.my_pwd.value != document.f.my_pwd1.value) {
        alert("비밀번호가 일치하지 않습니다")
        document.f.my_pwd1.value = ""
        document.f.my_pwd1.focus()
        return false;
    }

        //닉네임 유효성 검사 (영문소문자, 숫자만 허용)
        for (i = 0; i < document.f.my_nick.value.length; i++) {
            ch = document.f.my_id.value.charAt(i)
            if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z')) {
                alert("닉네임은 대소문자, 숫자만 입력가능합니다.")
                document.f.my_id.focus()
                document.f.my_id.select()
                return false;
            }
        }
    
        //닉네임에 공백 사용하지 않기
        if (document.f.my_nick.value.indexOf(" ") >= 0) {
            alert("닉네임에 공백을 사용할 수 없습니다.")
            document.f.my_nick.focus()
            document.f.my_nick.select()
            return false;
        }
        //닉네임 길이 체크 (4~12자)
        if (document.f.my_nick.value.length < 2 || document.f.my_nick.value.length > 6) {
            alert("닉네임을 2~6자까지 입력해주세요.")
            document.f.my_nick.focus()
            document.f.my_nick.select()
            return false;
        }

    if (document.f.my_add.value == "") {
        alert("이메일을 입력하지 않았습니다.")
        document.f.my_add.focus()
        return false;
    }
    

    if (regex.test(email) === false) {
        alert("잘못된 이메일 형식입니다.");
        document.f.my_add.value=""
        document.f.my_add.focus()
        return false;
    }
}




function sendIt1() {
    var email = document.g.my_add.value;
    var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
      var msg, ss, cc;

    //비밀번호 입력여부 체크
    if (document.g.my_pwd.value == "") {
        alert("비밀번호를 입력하지 않았습니다.")
        document.g.my_pwd.focus()
        return false;
    }

    //비밀번호 길이 체크(4~8자 까지 허용)
    if (document.g.my_pwd.value.length<4 || document.g.my_pwd.value.length>12) {
        alert("비밀번호를 4~12자까지 입력해주세요.")
        document.g.my_pwd.focus()
        document.g.my_pwd.select()
        return false;
    }

    //비밀번호와 비밀번호 확인 일치여부 체크
    if (document.g.my_pwd.value != document.g.my_pwd1.value) {
        alert("비밀번호가 일치하지 않습니다")
        document.g.my_pwd1.value = ""
        document.g.my_pwd1.focus()
        return false;
    }

        //닉네임 유효성 검사 (영문소문자, 숫자만 허용)
        for (i = 0; i < document.g.my_nick.value.length; i++) {
            ch = document.g.my_id.value.charAt(i)
            if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z')) {
                alert("닉네임은 대소문자, 숫자만 입력가능합니다.")
                document.g.my_id.focus()
                document.g.my_id.select()
                return false;
            }
        }
    
        //닉네임에 공백 사용하지 않기
        if (document.g.my_nick.value.indexOf(" ") >= 0) {
            alert("닉네임에 공백을 사용할 수 없습니다.")
            document.g.my_nick.focus()
            document.g.my_nick.select()
            return false;
        }
        //닉네임 길이 체크 (4~12자)
        if (document.g.my_nick.value.length < 2 || document.g.my_nick.value.length > 6) {
            alert("닉네임을 2~6자까지 입력해주세요.")
            document.g.my_nick.focus()
            document.g.my_nick.select()
            return false;
        }

    if (document.g.my_add.value == "") {
        alert("이메일을 입력하지 않았습니다.")
        document.g.my_add.focus()
        return false;
    }
    

    if (regex.test(email) === false) {
        alert("잘못된 이메일 형식입니다.");
        document.g.my_add.value=""
        document.g.my_add.focus()
        return false;
    }
}
