<div class="container-fluid">
    <div class="row">
        <ul class="nav nav-pills nav-stacked">
            <li>
                <form name="studSearchForm" action="" method="post" class="form-inline" role="form">
                    <div class="table table-responsive">
                        <table class="table-bordered" cellpadding="5">
                            <tr>
                                <%-- <td><span class="input-group-addon">Student ID</span></td>--%>
                                <td><input type="text" class="form-control" name="studID" placeholder="Student ID"></td>
                                <td>
                                    <%--<span class="input-group-addon">Student Name</span></td>--%>
                                <td>
                                    <input type="text" class="form-control" name="studName" placeholder="Student Name">
                                </td>
                            </tr>
                            <tr>
                                <%--<td><span class="input-group-addon">Email ID</span></td>--%>
                                <td>
                                    <input type="email" class="form-control" name="emailid" placeholder="Email ID">
                                </td>
                                <td><span class="input-group-addon">Is placed</span></td>
                                <td><input type="checkbox" class="form-control" name="isplaced" placeholder="isplaced">
                                </td>
                            </tr>
                            <tr>
                                <%--<td><span class="input-group-addon">SSC Marks</span></td>--%>
                                <td><input type="text" class="form-control" name="sscmarks" placeholder="SSC Marks">
                                </td>
                                <td>
                                    <select id="sscMarksCondition" class="form-control">
                                        <option>==</option>
                                        <option>&lt;=</option>
                                        <option>&gt;</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <%--<td><span class="input-group-addon">HSC Marks</span></td>--%>
                                <td><input type="text" class="form-control" name="hscmarks" placeholder="HSC Marks">
                                </td>
                                <td>
                                    <select id="hscMarksCondition" class="form-control">
                                        <option>==</option>
                                        <option>&lt;=</option>
                                        <option>&gt;</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <%--<td><span class="input-group-addon">MCA Marks</span></td>--%>
                                <td><input type="text" class="form-control" name="mcamarks" placeholder="MCA Marks">
                                </td>
                                <td>
                                    <select id="mcaMarksCondition" class="form-control">
                                        <option>==</option>
                                        <option>&lt;=</option>
                                        <option>&gt;</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="control-group">
                        <button type="submit" class="btn center-block" onclick="return searchStudents(this.form);"
                                style="width: 159px; ">Search
                        </button>
                        <div class="controls">
                        </div>
                    </div>
                </form>
            </li>
            <li>
                <div id="alerts" class="alert hidden">
                    <strong>HI Rajdip!!!</strong>
                </div>
            </li>
        </ul>
        <hr>
    </div>
</div>

<script type="text/javascript">
    function validateForm(form) {
        var ret = true;
        var studID = form.studID.value;
        document.getElementById("alerts").innerHTML = "";
        if (studID != "" && isNaN(studID)) {
            document.getElementById("alerts").innerHTML = "Please Enter valid Number!!!";
            ret = false;
            console.log(127);
        }
        var emailAddress = form.emailid.value;
        if (emailAddress != "") {
            var atpos = emailAddress.indexOf("@");
            var dotpos = emailAddress.lastIndexOf(".");
            if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
                document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Not a valid e-mail address");
                ret = false;
                console.log(193);
            }
        }
        var sscMarks = form.sscmarks.value;
        if (sscMarks != "" && isNaN(sscMarks)) {
            document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Invalid SSC Marks entered");
            ret = false;
            console.log(147);
        }
        var hscMarks = form.hscmarks.value;
        if (hscMarks != "" && isNaN(hscMarks)) {
            document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Invalid HSC Marks entered");
            ret = false;
            console.log(153);
        }
        var mcaMarks = form.mcamarks.value;
        if (sscMarks != "" && isNaN(mcaMarks)) {
            document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Invalid HSC Marks entered");
            ret = false;
            console.log(158);
        }
        if (ret == false) {
            document.getElementById("alerts").setAttribute('class', 'alert alert-danger show');
        }
        return ret;
    }

    function searchStudents(form) {
        if (validateForm(form) == false) {
            console.log("Form validation failed");
            //return false;
        }

        var param = {};
        for (var i = 0; i < form.length; i++) {
            console.log(form.elements[i].name + ":" + form.elements[i].type);
            if (form.elements[i].value != "" &&
                    ((form.elements[i].type == "email") ||
                            (form.elements[i].type == "text") ||
                            (form.elements[i].type == "checkbox")
                            )) {
                param[form.elements[i].name] = form.elements[i].value;
            }
        }
        console.log("140");
        $.get('viewstud.jsp', param, function (resultText) {
            console.log(JSON.stringify(resultText));
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
                rowTDEle.setAttribute('class', 'text-center');
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