<script type="text/javascript">
function validateForm(form) {
    var studentSearch = {};
    var ret = true;
    var studID = document.getElementById('student_id').value;
    document.getElementById("alerts").innerHTML = "";
    if (isNaN(studID)) {
        document.getElementById("alerts").innerHTML = "Please Enter valid Number!!!";
        ret = false;
        console.log(127);
    } else {
        studentSearch['student_id'] = studID;
    }

    var emailAddress = document.getElementById('student_email_id').value;
    if (emailAddress != 'undefined' && emailAddress != '') {
        var atpos = emailAddress.indexOf("@");
        var dotpos = emailAddress.lastIndexOf(".");
        if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
            document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Not a valid e-mail address");
            ret = false;
            console.log(193);
        } else {
            studentSearch['student_email_id'] = emailAddress;
        }
    }

    var isPlacedIsSelected = document.getElementById('select_is_placed');
    if (isPlacedIsSelected.checked) {
        var studentIsPlaced = document.getElementById('student_is_placed').value;
        studentSearch['student_is_placed'] = studentIsPlaced;
    }

    var sscMarks = document.getElementById('student_ssc_marks').value;
    var sscMarksCondition = document.getElementById('student_ssc_marks_condition').value;
    if (sscMarks != '') {
        if (isNaN(sscMarks)) {
            document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Invalid SSC Marks entered");
            ret = false;
            console.log(147);
        } else if (sscMarksCondition == '') {
            document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Please select SSC Marks Condition");
        } else {
            studentSearch['student_ssc_marks'] = sscMarks;
            studentSearch['student_ssc_marks_condition'] = sscMarksCondition;
        }
    }

    var hscMarks = document.getElementById('student_hsc_marks').value;
    var hscMarksCondition = document.getElementById('student_hsc_marks_condition').value;
    if (hscMarks != '') {
        if (isNaN(hscMarks)) {
            document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Invalid HSC Marks entered");
            ret = false;
            console.log(153);
        } else if (hscMarksCondition == '') {
            document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Please select HSC Marks Condition");
        } else {
            studentSearch['student_hsc_marks'] = sscMarks;
            studentSearch['student_hsc_marks_condition'] = sscMarksCondition;
        }
    }

    var mcaMarks = document.getElementById('student_mca_marks').value;
    var mcaMarksCondition = document.getElementById('student_mca_marks_condition').value;
    if (mcaMarks != '') {
        if (isNaN(mcaMarks)) {
            document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Invalid HSC Marks entered");
            ret = false;
            console.log(158);
        } else if (mcaMarksCondition == '') {
            document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Please select MCA Marks Condition");
        } else {
            studentSearch['student_mca_marks'] = sscMarks;
            studentSearch['student_mca_marks_condition'] = sscMarksCondition;
        }
    }

    if (ret == false) {
        document.getElementById("alerts").setAttribute('class', 'alert alert-danger show');
    }
    studentSearch['validated'] = ret;
    return studentSearch;
}

function searchStudents(form) {
    var stud = validateForm(form);
    if (stud['valiedated'] == false) {
        console.log("Form validation failed");
        return false;
    }
    console.log(JSON.stringify(stud));
    var param = {};
    param['studentQuery'] = stud;
    console.log("140");
    var debug = true;
    if (debug) {
        var resultEle = document.getElementById('scratchpad');
        createAndShowTable(dummyResponse(), resultEle);
    } else {
        $.get('SearchStudents.jsp', stud, function (resultText) {
            console.log("Rajdip148: " + JSON.stringify(resultText));
            if (resultText.hasOwnProperty('error')) {
                document.getElementById("alerts").innerHTML = resultText['error'];
                document.getElementById("alerts").setAttribute('class', 'alert alert-danger show');
                return false;
            }
            var resultEle = document.getElementById('scratchpad');
            createAndShowTable(resultText, resultEle);
        }, 'JSON');
    }
    return false;
}

function dummyResponse() {
    var keys = ["Student ID", "Name", "Email", "Placed", "SSC Marks", "HSC Marks", "MCA Marks"];
    var values = [
        ['1' , 'rajdip', 'r@d.s', 'true', '20', '30', '20']
    ];
    var dummyResponse = {};
    dummyResponse['keys'] = keys;
    dummyResponse['students'] = values;
    return dummyResponse;
}

function createAndShowTable(jsonObject, parentEle) {
    var studentDivEle = document.createElement('div');
    studentDivEle.setAttribute("name", "studentTableDiv");
    studentDivEle.setAttribute("class", "table table-responsive");

    var studentTableEle = document.createElement('table');
    studentTableEle.setAttribute('class', 'table table-hover table-bordered');
    studentTableEle.setAttribute('name', 'studentTable');
    studentTableEle.setAttribute('text-align', 'center');

    var captionEle = document.createElement('caption');

    var h3Ele = document.createElement('h3');
    h3Ele.setAttribute('align', 'center');
    var captionSpanEle = document.createElement('span');
    captionSpanEle.setAttribute('class', 'label label-primary');
    captionSpanEle.innerHTML = 'Students';
    h3Ele.appendChild(captionSpanEle);
    captionEle.appendChild(h3Ele);
    studentTableEle.appendChild(captionEle);

    var tHeadEle = document.createElement('thead');
    var tHeadTrEle = document.createElement('tr');
    tHeadTrEle.setAttribute('class', 'success');

    var studentKeysArray = jsonObject.keys;
    var studentColumnCounter = jsonObject.keys.length;
    for (var k = 0; k < studentColumnCounter; k++) {
        var tHeadTrTDEle = document.createElement('td');
        tHeadTrTDEle.setAttribute('class', 'text-center');
        tHeadTrTDEle.innerHTML = studentKeysArray[k];
        tHeadTrEle.appendChild(tHeadTrTDEle);
    }
    <!-- Adding delete student Column -->
    var deleteEle = document.createElement('td');
    deleteEle.innerHTML = 'Delete';
    tHeadTrEle.appendChild(deleteEle);

    tHeadEle.appendChild(tHeadTrEle);
    studentTableEle.appendChild(tHeadEle);

    var studentRowCounter = jsonObject.students.length;
    for (var row = 0; row < studentRowCounter; row++) {
        var tableRowEle = document.createElement('tr');
        var studentRow = jsonObject.students[row];
        tableRowEle.setAttribute('studid', studentRow[0]);
        for (var column = 0; column < studentColumnCounter; column++) {
            var rawTDEle = document.createElement('td');
            rawTDEle.innerHTML = studentRow[column];
            tableRowEle.appendChild(rawTDEle);
        }

        var rowTDEle = document.createElement('td');
        rowTDEle.innerHTML = '<button type="button" class="btn btn-xs btn-danger" id="delete-stud-btn" data-toggle="modal" data-target="#confirmDelete"data-title="Delete User" data-message="Are you sure you want to delete this Student ?" onclick="deleteTableRaw(this)"><i class="glyphicon glyphicon-warning-sign glyphicon-align-center"></i></button>';
        tableRowEle.appendChild(rowTDEle);
        studentTableEle.appendChild(tableRowEle);
    }
    studentDivEle.appendChild(studentTableEle);
    parentEle.innerHTML = '';
    parentEle.appendChild(studentDivEle);
    parentEle.setAttribute('class', 'show')
}

function deleteTableRaw(button) {
    var rawEle = button.parentNode.parentNode;
    var studId = rawEle.childNodes[0].innerText;
    var studentName  = rawEle.childNodes[1].innerText;
    var confirm = window.confirm("Do you Want to delete student:\n" +
            "Student ID: " + studId +
            "\nStudent Name: " + studentName);
    if (confirm == 'true') {
        $.get({
            url: deletestud.jsp,
            data: studId,
            success: function(response){
                alert(response);
            }
        }, 'JSON');
        rawEle.parentNode.removeChild(rawEle);
    }
}
</script>