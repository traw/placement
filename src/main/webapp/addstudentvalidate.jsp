<script type="text/javascript">
    function validate(form) {
        var validated = true;
        var student = {};
        var alertsEle = document.getElementById('alerts');
        alertsEle.innerHTML = '';


        var nameValid = document.getElementById('student_name').value;
        if(nameValid == '') {
            alertsEle.innerHTML.concat('Student name field cannot be empty');
            nameValid.focus;
            validated = false;
        } else {
            student['student_name'] = nameValid;
        }

        var emailValid = document.getElementById('student_email_id').value;
        if (emailValid == '') {
            alertsEle.innerHTML.concat('Email field cannot be empty');
            alertsEle.focus;
            validated = false;
        } else {
            var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (!filter.test(emailValid.value)) {
                alertsEle.innerHTML.concat('Please provide a valid email address');
                alertsEle.focus;
                validated = false;
            } else {
                student['student_email_id'] = emailValid;
            }
        }

        student['student_is_placed'] = document.getElementById('student_is_placed').value;

        var sscMarksValid = document.getElementById('ssc_marks').value;
        if(sscMarksValid == '') {
            alertsEle.innerHTML.concat('Student SSC marks field cannot be empty');
            sscMarksValid.focus;
            validated = false;
        } else {
            student['ssc_marks'] = sscMarksValid;
        }

        var hscMarksValid = document.getElementById('hsc_marks').value;
        if(hscMarksValid == '') {
            alertsEle.innerHTML.concat('Student HSC marks field cannot be empty');
            hscMarksValid.focus;
            validated = false;
        } else {
            student['hsc_marks'] = hscMarksValid;
        }

        var mcaMarksValid = document.getElementById('mca_marks').value;
        if(mcaMarksValid == '') {
            alertsEle.innerHTML.concat('Student MCA marks field cannot be empty');
            mcaMarksValid.focus;
            valideted = false;
        } else {
            student['mca_marks'] = mcaMarksValid;
        }
        student['validated'] = valideted;
        return student;
    }

    function addStudent(form) {
        var student = validate(form);
        if (student['validated'] == false) {
            console.log("Form validation failed");
            return false;
        }

        console.log(JSON.stringify(student));
        S.get('addstudentaction.jsp', student, function(response) {
            if (resultText.hasOwnProperty('error')) {
                document.getElementById("alerts").innerHTML = resultText['error'];
                document.getElementById("alerts").setAttribute('class', 'alert alert-danger show');
                return false;
            }
        });
    }
</script>