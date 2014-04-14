<fieldset>
    <legend><p class="text-info text-left">Student Search Form</p></legend>
    <form class="form" name="studSearchForm" action="" method="post" role="form"
          onsubmit="return searchStudents(this.form);">
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <input class="form-control" id="student_id" name="studID" size="30" type="text"
                           placeholder="Student ID">
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <input class="form-control" id="student_name" name="name" size="30" type="text"
                           placeholder="Student Name">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <input class="form-control" id="student_email_id" name="student[email]" size="30" type="email"
                           placeholder="Student Email ID">
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group input-group">
                	<span class="input-group-addon">
        				<input id="select_is_placed" type="checkbox">
      				</span>
                    <select id="student_is_placed" class="form-control">
                        <option>IsPlaced</option>
                        <option>Not Placed</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <input class="form-control" id="student_ssc_marks" name="student[sscmarks]" size="30" type="text"
                           placeholder="Student SSC Marks">
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group input-group">
                    <span class="input-group-addon">SSC Marks Condition</span>
                    <select id="student_ssc_marks_condition" class="form-control">
                        <option></option>
                        <option>=</option>
                        <option>&lt;=</option>
                        <option>&gt;=</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <input class="form-control" id="student_hsc_marks" name="student[hscmarks]" size="30" type="text"
                           placeholder="Student HSC Marks">
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group input-group">
                    <span class="input-group-addon">
        				<span class="">HSC Marks Condition</span>
      				</span>
                    <select id="student_hsc_marks_condition" class="form-control">
                        <option></option>
                        <option>=</option>
                        <option>&lt;=</option>
                        <option>&gt;=</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <input class="form-control" id="student_mca_marks" name="student[mcamarks]" size="30" type="text"
                           placeholder="Student MCA Marks">
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group input-group">
                    <span class="input-group-addon">
        			    <span class="">MCA Marks Condition</span>
      				</span>
                    <select id="student_mca_marks_condition" class="form-control">
                        <option></option>
                        <option>=</option>
                        <option>&lt;=</option>
                        <option>&gt;=</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <%--<button type="submit" id="btnSearch" class="btn btn-primary" onclick="return searchStudents(this.form);">Search</button>--%>
                <button type="submit" class="btn center-block bg-primary" style="width: 159px; ">
                    <span>Search</span>
                </button>
            </div>
            <div class="col-sm-4">
                <button type="reset" class="btn bg-primary" style="width: 159px; ">
                    <span>Reset</span>
                </button>
            </div>
        </div>
    </form>
</fieldset>
<div id="alerts" class="alert hidden">
    <strong>HI Rajdip!!!</strong>
</div>
<hr>

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
        $.get('SearchStudents.jsp', stud, function (resultText) {
            console.log("Rajdip148: " + JSON.stringify(resultText));
            if (resultText.hasOwnProperty('error')) {
                document.getElementById("alerts").innerHTML = resultText['error'];
                document.getElementById("alerts").setAttribute('class', 'alert alert-danger show');
                return false;
            }
            var resultEle = document.getElementById('alerts');
            createAndShowTable(resultText, resultEle);
        }, 'JSON');
        return false;
    }

    function createAndShowTable(jsonObject, parentEle) {
        var studentDivEle = document.createElement('div');
        studentDivEle.setAttribute("name", "studentTableDiv");
        studentDivEle.setAttribute("class", "table-responsive");

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

        var theadEle = document.createElement('thead');
        var theadTrEle = document.createElement('tr');
        theadTrEle.setAttribute('class', 'info');

        var studentKeysArray = jsonObject.keys;
        var studentColumnCounter = jsonObject.keys.length;
        for (var k = 0; k < studentColumnCounter; k++) {
            var theadTrTDEle = document.createElement('td');
            theadTrTDEle.setAttribute('class', 'text-center');
            theadTrTDEle.innerHTML = studentKeysArray[k];
            theadTrEle.appendChild(theadTrTDEle);
        }
        theadEle.appendChild(theadTrEle);
        studentTableEle.appendChild(theadEle);

        var studentRowCounter = jsonObject.students.length;
        for (var row = 0; row < studentRowCounter; row++) {
            var tableRowEle = document.createElement('tr');
            var studentRow = jsonObject.students[row];
            for (var column = 0; column < studentColumnCounter; column++) {
                var rowTDEle = document.createElement('td');
                rowTDEle.innerHTML = studentRow[column];
                tableRowEle.appendChild(rowTDEle);
            }
            studentTableEle.appendChild(tableRowEle);
        }
        studentDivEle.appendChild(studentTableEle);
        parentEle.appendChild(studentDivEle);
        parentEle.setAttribute('class', 'show')
    }

</script>